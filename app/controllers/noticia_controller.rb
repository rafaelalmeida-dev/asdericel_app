class NoticiaController < ApplicationController
  before_action :set_noticium, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Noticia", :noticia_path

  def index
    @q = Noticium.ransack(params[:q])
    @pagy, @noticia = pagy(@q.result)
  end

  def show
    add_breadcrumb @noticium.titulo, noticium_path(@noticium)
  end

  def new
    @noticium = Noticium.new
    add_breadcrumb t("common.actions.new"), new_noticium_path
  end

  def edit
    add_breadcrumb @noticium.titulo, noticium_path(@noticium)
    add_breadcrumb t("common.actions.edit"), edit_noticium_path(@noticium)
  end

  def create
    @noticium = Noticium.new(noticium_params)

    if @noticium.save
      redirect_to noticia_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @noticium.update(noticium_params)
      redirect_to noticia_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @noticium.destroy
      redirect_to noticia_url, notice: t("messages.deleted_successfully")
    else
      redirect_to noticia_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_noticium
    @noticium = Noticium.find_by(id: params[:id])
    redirect_to noticia_path, alert: t("messages.not_found") unless @noticium
  end

  def noticium_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Noticium.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:noticium).permit(permitted.map(&:to_sym))
  end
end

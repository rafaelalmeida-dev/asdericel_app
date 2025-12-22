class NoticiasController < ApplicationController
  before_action :set_noticia, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Noticia", :noticia_path

  def index
    @q = Noticia.ransack(params[:q])
    @pagy, @noticia = pagy(@q.result)
  end

  def show
    add_breadcrumb @noticia.titulo, noticia_path(@noticia)
  end

  def new
    @noticia = Noticia.new
    add_breadcrumb t("common.actions.new"), new_noticia_path
  end

  def edit
    add_breadcrumb @noticia.titulo, noticia_path(@noticia)
    add_breadcrumb t("common.actions.edit"), edit_noticia_path(@noticia)
  end

  def create
    @noticia = Noticia.new(noticia_params)

    if @noticia.save
      redirect_to noticia_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @noticia.update(noticia_params)
      redirect_to noticia_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @noticia.destroy
      redirect_to noticia_url, notice: t("messages.deleted_successfully")
    else
      redirect_to noticia_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_noticia
    @noticia = Noticia.find_by(id: params[:id])
    redirect_to noticia_path, alert: t("messages.not_found") unless @noticia
  end

  def noticia_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Noticia.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:noticia).permit(permitted.map(&:to_sym))
  end
end

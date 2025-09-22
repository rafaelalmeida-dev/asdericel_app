class EnsinosController < ApplicationController
  before_action :set_ensino, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Ensinos", :ensinos_path

  def index
    @q = Ensino.ransack(params[:q])
    @pagy, @ensinos = pagy(@q.result)
  end

  def show
    add_breadcrumb @ensino.nome, ensino_path(@ensino)
  end

  def new
    @ensino = Ensino.new
    add_breadcrumb t("common.actions.new"), new_ensino_path
  end

  def edit
    add_breadcrumb @ensino.nome, ensino_path(@ensino)
    add_breadcrumb t("common.actions.edit"), edit_ensino_path(@ensino)
  end

  def create
    @ensino = Ensino.new(ensino_params)

    if @ensino.save
      redirect_to ensinos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ensino.update(ensino_params)
      redirect_to ensinos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @ensino.destroy
      redirect_to ensinos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to ensinos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_ensino
    @ensino = Ensino.find_by(id: params[:id])
    redirect_to ensinos_path, alert: t("messages.not_found") unless @ensino
  end

  def ensino_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Ensino.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:ensino).permit(permitted.map(&:to_sym))
  end
end

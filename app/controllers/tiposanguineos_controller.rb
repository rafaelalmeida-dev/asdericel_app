class TiposanguineosController < ApplicationController
  before_action :set_tiposanguineo, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Tiposanguineos", :tiposanguineos_path

  def index
    @q = Tiposanguineo.ransack(params[:q])
    @pagy, @tiposanguineos = pagy(@q.result)
  end

  def show
    add_breadcrumb @tiposanguineo.nome, tiposanguineo_path(@tiposanguineo)
  end

  def new
    @tiposanguineo = Tiposanguineo.new
    add_breadcrumb t("common.actions.new"), new_tiposanguineo_path
  end

  def edit
    add_breadcrumb @tiposanguineo.nome, tiposanguineo_path(@tiposanguineo)
    add_breadcrumb t("common.actions.edit"), edit_tiposanguineo_path(@tiposanguineo)
  end

  def create
    @tiposanguineo = Tiposanguineo.new(tiposanguineo_params)

    if @tiposanguineo.save
      redirect_to tiposanguineos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tiposanguineo.update(tiposanguineo_params)
      redirect_to tiposanguineos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tiposanguineo.destroy
      redirect_to tiposanguineos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to tiposanguineos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_tiposanguineo
    @tiposanguineo = Tiposanguineo.find_by(id: params[:id])
    redirect_to tiposanguineos_path, alert: t("messages.not_found") unless @tiposanguineo
  end

  def tiposanguineo_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Tiposanguineo.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:tiposanguineo).permit(permitted.map(&:to_sym))
  end
end

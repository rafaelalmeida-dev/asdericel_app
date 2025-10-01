class MunicipiosController < ApplicationController
  before_action :set_municipio, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Municipios", :municipios_path

  def index
    @q = Municipio.ransack(params[:q])
    @pagy, @municipios = pagy(@q.result)
  end

  def show
    add_breadcrumb @municipio.nome, municipio_path(@municipio)
  end

  def new
    @municipio = Municipio.new
    add_breadcrumb t("common.actions.new"), new_municipio_path
  end

  def edit
    add_breadcrumb @municipio.nome, municipio_path(@municipio)
    add_breadcrumb t("common.actions.edit"), edit_municipio_path(@municipio)
  end

  def create
    @municipio = Municipio.new(municipio_params)

    if @municipio.save
      redirect_to municipios_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @municipio.update(municipio_params)
      redirect_to municipios_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @municipio.destroy
      redirect_to municipios_url, notice: t("messages.deleted_successfully")
    else
      redirect_to municipios_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_municipio
    @municipio = Municipio.find_by(id: params[:id])
    redirect_to municipios_path, alert: t("messages.not_found") unless @municipio
  end

  def municipio_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Municipio.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:municipio).permit(permitted.map(&:to_sym))
  end
end

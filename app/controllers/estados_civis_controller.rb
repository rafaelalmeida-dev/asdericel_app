class EstadosCivisController < ApplicationController
  before_action :set_estado_civil, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Estado Civil", :estados_civis_path

  def index
    @q = EstadoCivil.ransack(params[:q])
    @pagy, @estados_civis = pagy(@q.result)
  end

  def show
    add_breadcrumb @estado_civil.nome, estado_civil_path(@estado_civil)
  end

  def new
    @estado_civil = EstadoCivil.new
    add_breadcrumb t("common.actions.new"), new_estado_civil_path
  end

  def edit
    add_breadcrumb @estado_civil.nome, estado_civil_path(@estado_civil)
    add_breadcrumb t("common.actions.edit"), edit_estado_civil_path(@estado_civil)
  end

  def create
    @estado_civil = EstadoCivil.new(estado_civil_params)

    if @estado_civil.save
      redirect_to estados_civis_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estado_civil.update(estado_civil_params)
      redirect_to estados_civis_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @estado_civil.destroy
      redirect_to estados_civis_url, notice: t("messages.deleted_successfully")
    else
      redirect_to estados_civis_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_estado_civil
    @estado_civil = EstadoCivil.find_by(id: params[:id])
    redirect_to estados_civis_path, alert: t("messages.not_found") unless @estado_civil
  end

  def estado_civil_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = EstadoCivil.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:estado_civil_id).permit(permitted.map(&:to_sym))
  end
end

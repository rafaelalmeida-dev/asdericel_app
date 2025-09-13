class EstadosController < ApplicationController
  before_action :set_estado, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Estados", :estados_path

  def index
    @q = Estado.ransack(params[:q])
    @pagy, @estados = pagy(@q.result)
  end

  def show
    add_breadcrumb @estado.nome, estado_path(@estado)
  end

  def new
    @estado = Estado.new
    add_breadcrumb t("common.actions.new"), new_estado_path
  end

  def edit
    add_breadcrumb @estado.nome, estado_path(@estado)
    add_breadcrumb t("common.actions.edit"), edit_estado_path(@estado)
  end

  def create
    @estado = Estado.new(estado_params)

    if @estado.save
      redirect_to estados_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estado.update(estado_params)
      redirect_to estados_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @estado.destroy
      redirect_to estados_url, notice: t("messages.deleted_successfully")
    else
      redirect_to estados_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_estado
    @estado = Estado.find_by(id: params[:id])
    redirect_to estados_path, alert: t("messages.not_found") unless @estado
  end

  def estado_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Estado.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:estado).permit(permitted.map(&:to_sym))
  end
end

class CamisasController < ApplicationController
  before_action :set_camisa, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Camisas", :camisas_path

  def index
    @q = Camisa.ransack(params[:q])
    @pagy, @camisas = pagy(@q.result)
  end

  def show
    add_breadcrumb @camisa.numero, camisa_path(@camisa)
  end

  def new
    @camisa = Camisa.new
    add_breadcrumb t("common.actions.new"), new_camisa_path
  end

  def edit
    add_breadcrumb @camisa.numero, camisa_path(@camisa)
    add_breadcrumb t("common.actions.edit"), edit_camisa_path(@camisa)
  end

  def create
    @camisa = Camisa.new(camisa_params)

    if @camisa.save
      redirect_to camisas_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @camisa.update(camisa_params)
      redirect_to camisas_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @camisa.destroy
      redirect_to camisas_url, notice: t("messages.deleted_successfully")
    else
      redirect_to camisas_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_camisa
    @camisa = Camisa.find_by(id: params[:id])
    redirect_to camisas_path, alert: t("messages.not_found") unless @camisa
  end

  def camisa_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Camisa.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:camisa).permit(permitted.map(&:to_sym))
  end
end

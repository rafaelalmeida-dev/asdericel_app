class CalcasController < ApplicationController
  before_action :set_calca, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Calcas", :calcas_path

  def index
    @q = Calca.ransack(params[:q])
    @pagy, @calcas = pagy(@q.result)
  end

  def show
    add_breadcrumb @calca.numero, calca_path(@calca)
  end

  def new
    @calca = Calca.new
    add_breadcrumb t("common.actions.new"), new_calca_path
  end

  def edit
    add_breadcrumb @calca.numero, calca_path(@calca)
    add_breadcrumb t("common.actions.edit"), edit_calca_path(@calca)
  end

  def create
    @calca = Calca.new(calca_params)

    if @calca.save
      redirect_to calcas_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @calca.update(calca_params)
      redirect_to calcas_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @calca.destroy
      redirect_to calcas_url, notice: t("messages.deleted_successfully")
    else
      redirect_to calcas_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_calca
    @calca = Calca.find_by(id: params[:id])
    redirect_to calcas_path, alert: t("messages.not_found") unless @calca
  end

  def calca_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Calca.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:calca).permit(permitted.map(&:to_sym))
  end
end

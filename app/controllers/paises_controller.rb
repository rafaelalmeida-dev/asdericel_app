class PaisesController < ApplicationController
  before_action :set_pais, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Paises", :paises_path

  def index
    @q = Pais.ransack(params[:q])
    @pagy, @paises = pagy(@q.result)
  end

  def show
    add_breadcrumb @pais.nome, pais_path(@pais)
  end

  def new
    @pais = Pais.new
    add_breadcrumb t("common.actions.new"), new_pais_path
  end

  def edit
    add_breadcrumb @pais.nome, pais_path(@pais)
    add_breadcrumb t("common.actions.edit"), edit_pais_path(@pais)
  end

  def create
    @pais = Pais.new(pais_params)

    if @pais.save
      redirect_to paises_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pais.update(pais_params)
      redirect_to paises_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @pais.destroy
      redirect_to paises_url, notice: t("messages.deleted_successfully")
    else
      redirect_to paises_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_pais
    @pais = Pais.find_by(id: params[:id])
    redirect_to paises_path, alert: t("messages.not_found") unless @pais
  end

  def pais_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Pais.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:pais).permit(permitted.map(&:to_sym))
  end
end

class SexosController < ApplicationController
  before_action :set_sexo, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Sexos", :sexos_path

  def index
    @q = Sexo.ransack(params[:q])
    @pagy, @sexos = pagy(@q.result)
  end

  def show
    add_breadcrumb @sexo.nome, sexo_path(@sexo)
  end

  def new
    @sexo = Sexo.new
    add_breadcrumb t("common.actions.new"), new_sexo_path
  end

  def edit
    add_breadcrumb @sexo.nome, sexo_path(@sexo)
    add_breadcrumb t("common.actions.edit"), edit_sexo_path(@sexo)
  end

  def create
    @sexo = Sexo.new(sexo_params)

    if @sexo.save
      redirect_to sexos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sexo.update(sexo_params)
      redirect_to sexos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @sexo.destroy
      redirect_to sexos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to sexos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_sexo
    @sexo = Sexo.find_by(id: params[:id])
    redirect_to sexos_path, alert: t("messages.not_found") unless @sexo
  end

  def sexo_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Sexo.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:sexo).permit(permitted.map(&:to_sym))
  end
end

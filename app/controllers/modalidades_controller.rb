class ModalidadesController < ApplicationController
  before_action :set_modalidade, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Modalidades", :modalidades_path

  def index
    @q = Modalidade.ransack(params[:q])
    @pagy, @modalidades = pagy(@q.result)
  end

  def show
    add_breadcrumb @modalidade.nome, modalidade_path(@modalidade)
  end

  def new
    @modalidade = Modalidade.new
    add_breadcrumb t("common.actions.new"), new_modalidade_path
  end

  def edit
    add_breadcrumb @modalidade.nome, modalidade_path(@modalidade)
    add_breadcrumb t("common.actions.edit"), edit_modalidade_path(@modalidade)
  end

  def create
    @modalidade = Modalidade.new(modalidade_params)

    if @modalidade.save
      redirect_to modalidades_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @modalidade.update(modalidade_params)
      redirect_to modalidades_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @modalidade.destroy
      redirect_to modalidades_url, notice: t("messages.deleted_successfully")
    else
      redirect_to modalidades_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_modalidade
    @modalidade = Modalidade.find_by(id: params[:id])
    redirect_to modalidades_path, alert: t("messages.not_found") unless @modalidade
  end

  def modalidade_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Modalidade.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:modalidade).permit(permitted.map(&:to_sym), categoria_ids: [])
  end
end

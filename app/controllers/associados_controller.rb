class AssociadosController < ApplicationController
  before_action :set_associado, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Associados", :associados_path

  def index
    @q = Associado.ransack(params[:q])
    @pagy, @associados = pagy(@q.result)
  end

  def show
    add_breadcrumb @associado.pessoa.nome, associado_path(@associado)
  end

  def new
    @associado = Associado.new
    @associado.build_pessoa
    add_breadcrumb t("common.actions.new"), new_associado_path
  end

  def edit
    add_breadcrumb @associado.celular, associado_path(@associado)
    add_breadcrumb t("common.actions.edit"), edit_associado_path(@associado)
  end

  def create
    @associado = Associado.new(associado_params)

    if @associado.save
      redirect_to associados_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @associado.update(associado_params)
      redirect_to associados_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @associado.destroy
      redirect_to associados_url, notice: t("messages.deleted_successfully")
    else
      redirect_to associados_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_associado
    @associado = Associado.find_by(id: params[:id])
    redirect_to associados_path, alert: t("messages.not_found") unless @associado
  end

  def associado_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Associado.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:associado).permit(permitted.map(&:to_sym),
    pessoa_attributes: [:nome, :nomesocial, :nomeconhecido, :pai, :mae, :cpf, 
    :datanascimento, :sexo_id, :funcao_id, :estadocivil_id])
  end
end

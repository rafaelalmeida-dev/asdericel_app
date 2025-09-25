class FuncaosController < ApplicationController
  before_action :set_funcao, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Funcaos", :funcaos_path

  def index
    @q = Funcao.ransack(params[:q])
    @pagy, @funcaos = pagy(@q.result)
  end

  def show
    add_breadcrumb @funcao.nome, funcao_path(@funcao)
  end

  def new
    @funcao = Funcao.new
    add_breadcrumb t("common.actions.new"), new_funcao_path
  end

  def edit
    add_breadcrumb @funcao.nome, funcao_path(@funcao)
    add_breadcrumb t("common.actions.edit"), edit_funcao_path(@funcao)
  end

  def create
    @funcao = Funcao.new(funcao_params)

    if @funcao.save
      redirect_to funcaos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @funcao.update(funcao_params)
      redirect_to funcaos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @funcao.destroy
      redirect_to funcaos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to funcaos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_funcao
    @funcao = Funcao.find_by(id: params[:id])
    redirect_to funcaos_path, alert: t("messages.not_found") unless @funcao
  end

  def funcao_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Funcao.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:funcao).permit(permitted.map(&:to_sym))
  end
end

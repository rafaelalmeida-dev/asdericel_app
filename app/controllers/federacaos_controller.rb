class FederacaosController < ApplicationController
  before_action :set_federacao, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Federacaos", :federacaos_path

  def index
    @q = Federacao.ransack(params[:q])
    @pagy, @federacaos = pagy(@q.result)
  end

  def show
    add_breadcrumb @federacao.sigla, federacao_path(@federacao)
  end

  def new
    @federacao = Federacao.new
    add_breadcrumb t("common.actions.new"), new_federacao_path
  end

  def edit
    add_breadcrumb @federacao.sigla, federacao_path(@federacao)
    add_breadcrumb t("common.actions.edit"), edit_federacao_path(@federacao)
  end

  def create
    @federacao = Federacao.new(federacao_params)

    if @federacao.save
      redirect_to federacaos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @federacao.update(federacao_params)
      redirect_to federacaos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @federacao.destroy
      redirect_to federacaos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to federacaos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_federacao
    @federacao = Federacao.find_by(id: params[:id])
    redirect_to federacaos_path, alert: t("messages.not_found") unless @federacao
  end

  def federacao_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Federacao.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:federacao).permit(permitted.map(&:to_sym))
  end
end

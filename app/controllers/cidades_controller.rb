class CidadesController < ApplicationController
  before_action :set_cidade, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Cidades", :cidades_path

  def index
    @q = Cidade.ransack(params[:q])
    @pagy, @cidades = pagy(@q.result)
  end

  def show
    add_breadcrumb @cidade.nome, cidade_path(@cidade)
  end

  def new
    @cidade = Cidade.new
    add_breadcrumb t("common.actions.new"), new_cidade_path
  end

  def edit
    add_breadcrumb @cidade.nome, cidade_path(@cidade)
    add_breadcrumb t("common.actions.edit"), edit_cidade_path(@cidade)
  end

  def create
    @cidade = Cidade.new(cidade_params)

    if @cidade.save
      redirect_to cidades_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cidade.update(cidade_params)
      redirect_to cidades_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @cidade.destroy
      redirect_to cidades_url, notice: t("messages.deleted_successfully")
    else
      redirect_to cidades_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_cidade
    @cidade = Cidade.find_by(id: params[:id])
    redirect_to cidades_path, alert: t("messages.not_found") unless @cidade
  end

  def cidade_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Cidade.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:cidade).permit(permitted.map(&:to_sym))
  end
end

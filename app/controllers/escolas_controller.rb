class EscolasController < ApplicationController
  before_action :set_escola, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Escolas", :escolas_path

  def index
    @q = Escola.ransack(params[:q])
    @pagy, @escolas = pagy(@q.result)
  end

  def show
    add_breadcrumb @escola.nome, escola_path(@escola)
  end

  def new
    @escola = Escola.new
    add_breadcrumb t("common.actions.new"), new_escola_path
  end

  def edit
    add_breadcrumb @escola.nome, escola_path(@escola)
    add_breadcrumb t("common.actions.edit"), edit_escola_path(@escola)
  end

  def create
    @escola = Escola.new(escola_params)

    if @escola.save
      redirect_to escolas_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @escola.update(escola_params)
      redirect_to escolas_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @escola.destroy
      redirect_to escolas_url, notice: t("messages.deleted_successfully")
    else
      redirect_to escolas_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_escola
    @escola = Escola.find_by(id: params[:id])
    redirect_to escolas_path, alert: t("messages.not_found") unless @escola
  end

  def escola_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Escola.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:escola).permit(permitted.map(&:to_sym))
  end
end

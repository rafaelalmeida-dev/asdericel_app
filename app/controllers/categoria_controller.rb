class CategoriaController < ApplicationController
  before_action :set_categorium, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Categoria", :categoria_path

  def index
    @q = Categorium.ransack(params[:q])
    @pagy, @categoria = pagy(@q.result)
  end

  def show
    add_breadcrumb @categorium.nome, categorium_path(@categorium)
  end

  def new
    @categorium = Categorium.new
    add_breadcrumb t("common.actions.new"), new_categorium_path
  end

  def edit
    add_breadcrumb @categorium.nome, categorium_path(@categorium)
    add_breadcrumb t("common.actions.edit"), edit_categorium_path(@categorium)
  end

  def create
    @categorium = Categorium.new(categorium_params)

    if @categorium.save
      redirect_to categoria_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @categorium.update(categorium_params)
      redirect_to categoria_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @categorium.destroy
      redirect_to categoria_url, notice: t("messages.deleted_successfully")
    else
      redirect_to categoria_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_categorium
    @categorium = Categorium.find_by(id: params[:id])
    redirect_to categoria_path, alert: t("messages.not_found") unless @categorium
  end

  def categorium_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Categorium.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:categorium).permit(permitted.map(&:to_sym))
  end
end

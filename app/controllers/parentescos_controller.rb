class ParentescosController < ApplicationController
  before_action :set_parentesco, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Parentescos", :parentescos_path

  def index
    @q = Parentesco.ransack(params[:q])
    @pagy, @parentescos = pagy(@q.result)
  end

  def show
    add_breadcrumb @parentesco.nome, parentesco_path(@parentesco)
  end

  def new
    @parentesco = Parentesco.new
    add_breadcrumb t("common.actions.new"), new_parentesco_path
  end

  def edit
    add_breadcrumb @parentesco.nome, parentesco_path(@parentesco)
    add_breadcrumb t("common.actions.edit"), edit_parentesco_path(@parentesco)
  end

  def create
    @parentesco = Parentesco.new(parentesco_params)

    if @parentesco.save
      redirect_to parentescos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @parentesco.update(parentesco_params)
      redirect_to parentescos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @parentesco.destroy
      redirect_to parentescos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to parentescos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_parentesco
    @parentesco = Parentesco.find_by(id: params[:id])
    redirect_to parentescos_path, alert: t("messages.not_found") unless @parentesco
  end

  def parentesco_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Parentesco.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:parentesco).permit(permitted.map(&:to_sym))
  end
end

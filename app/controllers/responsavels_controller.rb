class ResponsavelsController < ApplicationController
  before_action :set_responsavel, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Responsavels", :responsavels_path

  def index
    @q = Responsavel.ransack(params[:q])
    @pagy, @responsavels = pagy(@q.result)
  end

  def show
    add_breadcrumb @responsavel.nome, responsavel_path(@responsavel)
  end

  def new
    @responsavel = Responsavel.new
    add_breadcrumb t("common.actions.new"), new_responsavel_path
  end

  def edit
    add_breadcrumb @responsavel.nome, responsavel_path(@responsavel)
    add_breadcrumb t("common.actions.edit"), edit_responsavel_path(@responsavel)
  end

  def create
    @responsavel = Responsavel.new(responsavel_params)

    if @responsavel.save
      redirect_to responsavels_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @responsavel.update(responsavel_params)
      redirect_to responsavels_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @responsavel.destroy
      redirect_to responsavels_url, notice: t("messages.deleted_successfully")
    else
      redirect_to responsavels_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_responsavel
    @responsavel = Responsavel.find_by(id: params[:id])
    redirect_to responsavels_path, alert: t("messages.not_found") unless @responsavel
  end

  def responsavel_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Responsavel.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:responsavel).permit(permitted.map(&:to_sym))
  end
end

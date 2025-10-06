class EstadocivilsController < ApplicationController
  before_action :set_estadocivil, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Estado Civil", :estadocivils_path

  def index
    @q = Estadocivil.ransack(params[:q])
    @pagy, @estadocivils = pagy(@q.result)
  end

  def show
    add_breadcrumb @estadocivil.nome, estadocivil_path(@estadocivil)
  end

  def new
    @estadocivil = Estadocivil.new
    add_breadcrumb t("common.actions.new"), new_estadocivil_path
  end

  def edit
    add_breadcrumb @estadocivil.nome, estadocivil_path(@estadocivil)
    add_breadcrumb t("common.actions.edit"), edit_estadocivil_path(@estadocivil)
  end

  def create
    @estadocivil = Estadocivil.new(estadocivil_params)

    if @estadocivil.save
      redirect_to estadocivils_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estadocivil.update(estadocivil_params)
      redirect_to estadocivils_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @estadocivil.destroy
      redirect_to estadocivils_url, notice: t("messages.deleted_successfully")
    else
      redirect_to estadocivils_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_estadocivil
    @estadocivil = Estadocivil.find_by(id: params[:id])
    redirect_to estadocivils_path, alert: t("messages.not_found") unless @estadocivil
  end

  def estadocivil_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Estadocivil.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:estadocivil).permit(permitted.map(&:to_sym))
  end
end

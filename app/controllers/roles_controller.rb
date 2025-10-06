class RolesController < ApplicationController
  before_action :set_role, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Role", :roles_path

  def index
    @q = Role.ransack(params[:q])
    @pagy, @roles = pagy(@q.result)
  end

  def show
    add_breadcrumb @role.nome, role_path(@role)
  end

  def new
    @role = Role.new
    add_breadcrumb t("common.actions.new"), new_role_path
  end

  def edit
    add_breadcrumb @role.nome, role_path(@role)
    add_breadcrumb t("common.actions.edit"), edit_role_path(@role)
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to roles_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      redirect_to roles_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @role.destroy
      redirect_to roles_url, notice: t("messages.deleted_successfully")
    else
      redirect_to roles_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_role
    @role = Role.find_by(id: params[:id])
    redirect_to roles_path, alert: t("messages.not_found") unless @role
  end

  def role_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Role.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:role).permit(permitted.map(&:to_sym))
  end
end

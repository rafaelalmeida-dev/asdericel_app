class EquipesController < ApplicationController
  before_action :set_equipe, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Equipes", :equipes_path

  def index
    @q = Equipe.ransack(params[:q])
    @pagy, @equipes = pagy(@q.result)
  end

  def show
    add_breadcrumb @equipe.nome, equipe_path(@equipe)
  end

  def new
    @equipe = Equipe.new
    add_breadcrumb t("common.actions.new"), new_equipe_path
  end

  def edit
    add_breadcrumb @equipe.nome, equipe_path(@equipe)
    add_breadcrumb t("common.actions.edit"), edit_equipe_path(@equipe)
  end

  def create
    @equipe = Equipe.new(equipe_params)

    if @equipe.save
      redirect_to equipes_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @equipe.update(equipe_params)
      redirect_to equipes_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @equipe.destroy
      redirect_to equipes_url, notice: t("messages.deleted_successfully")
    else
      redirect_to equipes_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_equipe
    @equipe = Equipe.find_by(id: params[:id])
    redirect_to equipes_path, alert: t("messages.not_found") unless @equipe
  end

  def equipe_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Equipe.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:equipe).permit(permitted.map(&:to_sym))
  end
end

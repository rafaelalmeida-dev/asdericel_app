class EquipesController < ApplicationController
  before_action :set_equipe, only: %i[show edit update destroy atletas]

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

  def atletas
    @atletas = Atleta.all
    add_breadcrumb t("common.actions.atletas")
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

  def associar_atletas
    equipe = Equipe.find(params[:id])
    atleta = Atleta.find_by(id: params[:atleta_id])

    return render json: { error: "Atleta não informado" }, status: :unprocessable_entity if atleta.nil?

    if AtletaEquipe.exists?(equipe_id: equipe.id, atleta_id: atleta.id, deleted_at: nil)
      return render json: { error: "Atleta já associado a esta equipe" }, status: :unprocessable_entity
    end

    atleta_equipe = AtletaEquipe.create!(
      equipe_id: equipe.id,
      atleta_id: atleta.id
    )

    render json: {
      success: true,
      atleta_equipe_id: atleta_equipe.id
    }
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

  def remover_atleta
    atleta_equipe = AtletaEquipe.find_by(id: params[:id], deleted_at: nil)
    return render json: { error: "Registro não encontrado" }, status: :not_found unless atleta_equipe

    atleta_equipe.update!(deleted_at: Time.current)
    render json: { success: true }
  end

  private

  def set_equipe
    @equipe = Equipe.find_by(id: params[:id])
    redirect_to equipes_path, alert: t("messages.not_found") unless @equipe
  end

  def equipe_params
    params.require(:equipe).permit(:nome, :modalidade_id)
  end
end

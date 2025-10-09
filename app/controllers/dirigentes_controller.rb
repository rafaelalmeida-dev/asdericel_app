class DirigentesController < ApplicationController
  before_action :set_dirigente, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Dirigentes", :dirigentes_path

  def index
    @q = Dirigente.ransack(params[:q])
    @pagy, @dirigentes = pagy(@q.result)
  end

  def show
    add_breadcrumb @dirigente.cref, dirigente_path(@dirigente)
  end

  def new
    @dirigente = Dirigente.new
    @dirigente.build_pessoa
    add_breadcrumb t("common.actions.new"), new_dirigente_path
  end

  def edit
    add_breadcrumb @dirigente.cref, dirigente_path(@dirigente)
    add_breadcrumb t("common.actions.edit"), edit_dirigente_path(@dirigente)
  end

  def create
    @dirigente = Dirigente.new(dirigente_params)

    if @dirigente.save
      redirect_to dirigentes_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dirigente.update(dirigente_params)
      redirect_to dirigentes_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @dirigente.destroy
      redirect_to dirigentes_url, notice: t("messages.deleted_successfully")
    else
      redirect_to dirigentes_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_dirigente
    @dirigente = Dirigente.find_by(id: params[:id])
    redirect_to dirigentes_path, alert: t("messages.not_found") unless @dirigente
  end

  def dirigente_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Dirigente.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:dirigente).permit(permitted.map(&:to_sym),
    pessoa_attributes: [ :nome, :nomesocial, :nomeconhecido, :pai, :mae, :cpf, :datanascimento, :sexo_id, :funcao_id, :estadocivil_id, :ensino_id ],
  )
  end
end

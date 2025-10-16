class AtletasController < ApplicationController
  before_action :set_atleta, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Atletas", :atletas_path

  def index
    @q = Atleta.ransack(params[:q])
    @pagy, @atletas = pagy(@q.result)
  end

  def show
    add_breadcrumb @atleta.numeroSus, atleta_path(@atleta)
  end

  def new
    @atleta = Atleta.new
    @atleta.atleta_federacoes.build
    @federacoes = Federacao.all
    @atleta.build_pessoa
    add_breadcrumb t("common.actions.new"), new_atleta_path
  end

  def edit
    add_breadcrumb @atleta.numeroSus, atleta_path(@atleta)
    add_breadcrumb t("common.actions.edit"), edit_atleta_path(@atleta)
  end

  def create
    @atleta = Atleta.new(atleta_params)
    if @atleta.save
      federacoes_params = params[:atleta][:federacoes]
      byebug
      if federacoes_params.present?
        federacoes_params.each_value do |fed|
          @atleta.atleta_federacoes.create(
            federacao_id: fed[:federacao_id],
            numero: fed[:numero]
          )
        end
      end

      redirect_to atletas_path, notice: t("messages.created_successfully")
    else
      @federacoes = Federacao.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @atleta.update(atleta_params)
      redirect_to atletas_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @atleta.destroy
      redirect_to atletas_url, notice: t("messages.deleted_successfully")
    else
      redirect_to atletas_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end


  private

  def set_atleta
    @atleta = Atleta.find_by(id: params[:id])
    redirect_to atletas_path, alert: t("messages.not_found") unless @atleta
  end

  def atleta_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Atleta.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:atleta).permit(permitted.map(&:to_sym),
    pessoa_attributes: [ :nome, :nomesocial, :nomeconhecido, :sexo_id, :estadocivil_id, :mae, :pai, :datanascimento, :funcao_id, :cpf, :cinrg, :orgaoemissor, :dataexpedicao, :passaporte ])
  end
end

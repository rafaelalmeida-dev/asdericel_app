class AtletaFederacoesController < ApplicationController
  before_action :set_atleta

  def create
    @atleta_federacao = @atleta.atleta_federacoes.new(atleta_federacao_params)
    if @atleta_federacao.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @atleta, notice: "Federação adicionada!" }
      end
    else
      render turbo_stream: turbo_stream.replace(
        "federacoes_modal",
        partial: "atletas/modal_federacao",
        locals: { atleta: @atleta, federacoes: Federacao.all, errors: @atleta_federacao.errors }
      )
    end
  end

  def destroy
    @atleta_federacao = @atleta.atleta_federacoes.find(params[:id])
    @atleta_federacao.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @atleta, notice: "Federação removida!" }
    end
  end

  private

  def set_atleta
    @atleta = Atleta.find(params[:atleta_id])
  end

  def atleta_federacao_params
    params.require(:atleta_federacao).permit(:federacao_id, :numero)
  end
end

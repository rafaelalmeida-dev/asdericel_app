class ExternoController < ApplicationController
  layout 'minimal_externa'

  def club_history; end
  def simbolo; end
  def galeria; end
  def diretoria; end
  def doacoes; end
  def hero; end
  def about; end
  def team; end
  def technical_team; end

  def noticias
    @q = Noticia.ransack(params[:q])
    @q.sorts = 'data_publicacao desc' if @q.sorts.empty?
    if params[:categoria].present?
      @noticias = @q.result.por_categoria(params[:categoria])
    else
      @noticias = @q.result
    end
    @pagy, @noticias = pagy(@noticias, items: 12)
    render "externo/noticias"
  end

  def noticia
    @noticia = Noticia.find(params[:id])
    render "externo/noticia"
  end
end
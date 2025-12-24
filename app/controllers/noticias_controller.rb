class NoticiasController < ApplicationController
  before_action :set_noticia, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Notícias", :noticias_path

  def index
    @q = Noticia.ransack(params[:q])
    @pagy, @noticias = pagy(@q.result.order(data_publicacao: :desc))
  end

  def show
    add_breadcrumb @noticia.titulo, noticia_path(@noticia)
  end

  def new
    @noticia = Noticia.new
    add_breadcrumb t("common.actions.new"), new_noticia_path
  end

  def edit
    add_breadcrumb @noticia.titulo, noticia_path(@noticia)
    add_breadcrumb t("common.actions.edit"), edit_noticia_path(@noticia)
  end

  def create
    @noticia = Noticia.new(noticia_params)

    if @noticia.save
      redirect_to noticias_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @noticia.update(noticia_params)
      redirect_to noticias_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @noticia.destroy
      redirect_to noticias_path, notice: t("messages.deleted_successfully"), status: :see_other
    else
      redirect_to noticias_path, alert: t("messages.delete_failed_due_to_dependencies"), status: :see_other
    end
  end

  # Ações públicas
  def index_publico
    @q = Noticia.ransack(params[:q])
    @q.sorts = "data_publicacao desc" if @q.sorts.empty?

    if params[:categoria].present?
      @noticias = @q.result.por_categoria(params[:categoria])
    else
      @noticias = @q.result
    end

    @pagy, @noticias = pagy(@noticias, items: 12)
  end

  def show_publico
    @noticia = Noticia.find(params[:id])
  end

  private

  def set_noticia
    @noticia = Noticia.find_by(id: params[:id])
    redirect_to noticias_path, alert: t("messages.not_found") unless @noticia
  end

  def noticia_params
    params.require(:noticia).permit(:titulo, :conteudo, :categoria, :imagem, :imagem_upload, :data_publicacao, :destaque)
  end
end

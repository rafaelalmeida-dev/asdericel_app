class NoticiasController < ApplicationController
  before_action :set_noticia, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
<<<<<<< HEAD
<<<<<<< HEAD
  add_breadcrumb "Noticia", :noticia_path

  def index
    @q = Noticia.ransack(params[:q])
    @pagy, @noticia = pagy(@q.result)
=======
=======
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  add_breadcrumb "Notícias", :noticias_path

  def index
    @q = Noticia.ransack(params[:q])
    @pagy, @noticias = pagy(@q.result.order(data_publicacao: :desc))
<<<<<<< HEAD
>>>>>>> 660cd8a (criado partes de noticias)
=======
=======
  add_breadcrumb "Noticia", :noticia_path

  def index
    @q = Noticia.ransack(params[:q])
    @pagy, @noticia = pagy(@q.result)
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
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
<<<<<<< HEAD
<<<<<<< HEAD
      redirect_to noticia_path, notice: t("messages.created_successfully")
=======
      redirect_to noticias_path, notice: t("messages.created_successfully")
>>>>>>> 660cd8a (criado partes de noticias)
=======
      redirect_to noticias_path, notice: t("messages.created_successfully")
=======
      redirect_to noticia_path, notice: t("messages.created_successfully")
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @noticia.update(noticia_params)
<<<<<<< HEAD
<<<<<<< HEAD
      redirect_to noticia_path, notice: t("messages.updated_successfully"), status: :see_other
=======
      redirect_to noticias_path, notice: t("messages.updated_successfully"), status: :see_other
>>>>>>> 660cd8a (criado partes de noticias)
=======
      redirect_to noticias_path, notice: t("messages.updated_successfully"), status: :see_other
=======
      redirect_to noticia_path, notice: t("messages.updated_successfully"), status: :see_other
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @noticia.destroy
<<<<<<< HEAD
<<<<<<< HEAD
      redirect_to noticia_url, notice: t("messages.deleted_successfully")
    else
      redirect_to noticia_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

=======
=======
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
      redirect_to noticias_path, notice: t("messages.deleted_successfully"), status: :see_other
    else
      redirect_to noticias_path, alert: t("messages.delete_failed_due_to_dependencies"), status: :see_other
    end
  end

  # Ações públicas
  def index_publico
    @q = Noticia.ransack(params[:q])
    @q.sorts = 'data_publicacao desc' if @q.sorts.empty?
    
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

<<<<<<< HEAD
>>>>>>> 660cd8a (criado partes de noticias)
=======
=======
      redirect_to noticia_url, notice: t("messages.deleted_successfully")
    else
      redirect_to noticia_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  private

  def set_noticia
    @noticia = Noticia.find_by(id: params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
    redirect_to noticia_path, alert: t("messages.not_found") unless @noticia
  end

  def noticia_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Noticia.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:noticia).permit(permitted.map(&:to_sym))
=======
=======
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
    redirect_to noticias_path, alert: t("messages.not_found") unless @noticia
  end

  def noticia_params
    params.require(:noticia).permit(:titulo, :conteudo, :categoria, :imagem, :imagem_upload, :data_publicacao, :destaque)
<<<<<<< HEAD
>>>>>>> 660cd8a (criado partes de noticias)
=======
=======
    redirect_to noticia_path, alert: t("messages.not_found") unless @noticia
  end

  def noticia_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Noticia.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:noticia).permit(permitted.map(&:to_sym))
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  end
end

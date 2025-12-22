class CategoriasController < ApplicationController
  before_action :set_categoria, only: %i[show edit update destroy]

  def index
    @categorias = Categoria.all
  end

  def show
  end

  def new
    @categoria = Categoria.new
  end

  def edit
  end

  def create
    @categoria = Categoria.new(categoria_params)
    if @categoria.save
      redirect_to @categoria, notice: t("common.created", model: Categoria.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @categoria.update(categoria_params)
      redirect_to @categoria, notice: t("common.updated", model: Categoria.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @categoria.destroy
    redirect_to categorias_url, notice: t("common.destroyed", model: Categoria.model_name.human)
  end

  private
    def set_categoria
      @categoria = Categoria.find(params[:id])
    end

    def categoria_params
      params.require(:categoria).permit(:nome, :sexo, :idade)
    end
end

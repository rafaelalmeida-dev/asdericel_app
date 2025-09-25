class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Pessoas", :pessoas_path

  def index
    @q = Pessoa.ransack(params[:q])
    @pagy, @pessoas = pagy(@q.result)
  end

  def show
    add_breadcrumb @pessoa.nome, pessoa_path(@pessoa)
  end

  def new
    @pessoa = Pessoa.new
    add_breadcrumb t("common.actions.new"), new_pessoa_path
  end

  def edit
    add_breadcrumb @pessoa.nome, pessoa_path(@pessoa)
    add_breadcrumb t("common.actions.edit"), edit_pessoa_path(@pessoa)
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)

    if @pessoa.save
      redirect_to pessoas_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pessoa.update(pessoa_params)
      redirect_to pessoas_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @pessoa.destroy
      redirect_to pessoas_url, notice: t("messages.deleted_successfully")
    else
      redirect_to pessoas_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_pessoa
    @pessoa = Pessoa.find_by(id: params[:id])
    redirect_to pessoas_path, alert: t("messages.not_found") unless @pessoa
  end

  def pessoa_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Pessoa.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:pessoa).permit(permitted.map(&:to_sym))
  end
end

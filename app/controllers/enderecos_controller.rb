class EnderecosController < ApplicationController
  before_action :set_endereco, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Enderecos", :enderecos_path

  def index
    @q = Endereco.ransack(params[:q])
    @pagy, @enderecos = pagy(@q.result)
  end

  def show
    add_breadcrumb @endereco.cep, endereco_path(@endereco)
  end

  def new
    @endereco = Endereco.new
    add_breadcrumb t("common.actions.new"), new_endereco_path
  end

  def edit
    add_breadcrumb @endereco.cep, endereco_path(@endereco)
    add_breadcrumb t("common.actions.edit"), edit_endereco_path(@endereco)
  end

  def create
    @endereco = Endereco.new(endereco_params)

    if @endereco.save
      redirect_to enderecos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @endereco.update(endereco_params)
      redirect_to enderecos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @endereco.destroy
      redirect_to enderecos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to enderecos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_endereco
    @endereco = Endereco.find_by(id: params[:id])
    redirect_to enderecos_path, alert: t("messages.not_found") unless @endereco
  end

  def endereco_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Endereco.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:endereco).permit(permitted.map(&:to_sym))
  end
end

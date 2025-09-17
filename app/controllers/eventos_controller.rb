class EventosController < ApplicationController
  before_action :set_evento, only: %i[show edit update destroy]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Eventos", :eventos_path

  def index
    @q = Evento.ransack(params[:q])
    @pagy, @eventos = pagy(@q.result)
  end

  def show
    add_breadcrumb @evento.nome, evento_path(@evento)
  end

  def new
    @evento = Evento.new
    add_breadcrumb t("common.actions.new"), new_evento_path
  end

  def edit
    add_breadcrumb @evento.nome, evento_path(@evento)
    add_breadcrumb t("common.actions.edit"), edit_evento_path(@evento)
  end

  def create
    @evento = Evento.new(evento_params)

    if @evento.save
      redirect_to eventos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @evento.update(evento_params)
      redirect_to eventos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @evento.destroy
      redirect_to eventos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to eventos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_evento
    @evento = Evento.find_by(id: params[:id])
    redirect_to eventos_path, alert: t("messages.not_found") unless @evento
  end

  def evento_params
    unpermitted = %w[id deleted_at created_by updated_by]
    permitted = Evento.column_names.reject { |col| unpermitted.include?(col) }
    params.require(:evento).permit(permitted.map(&:to_sym))
  end
end

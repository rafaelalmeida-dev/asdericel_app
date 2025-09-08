class AssociadosController < ApplicationController
  before_action :set_associado, only: %i[ show edit update destroy ]

  # GET /associados or /associados.json
  def index
   @q = Associado.ransack(params[:q])   # inicializa o Ransack
    @associados = @q.result(distinct: true) # retorna resultado
  end

  # GET /associados/1 or /associados/1.json
  def show
  end

  # GET /associados/new
  def new
    @associado = Associado.new
  end

  # GET /associados/1/edit
  def edit
  end

  # POST /associados or /associados.json
  def create
    @associado = Associado.new(associado_params)

    respond_to do |format|
      if @associado.save
        format.html { redirect_to @associado, notice: "Associado was successfully created." }
        format.json { render :show, status: :created, location: @associado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associados/1 or /associados/1.json
  def update
    respond_to do |format|
      if @associado.update(associado_params)
        format.html { redirect_to @associado, notice: "Associado was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @associado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associados/1 or /associados/1.json
  def destroy
    @associado.destroy!

    respond_to do |format|
      format.html { redirect_to associados_path, notice: "Associado was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associado
      @associado = Associado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def associado_params
      params.require(:associado).permit(:nome, :nome_social, :nome_conhecido, :mae, :pai, :data_nascimento, :sexo, :cpf, :rg, :orgao_emissor, :data_expedicao, :passaporte, :estado_civil, :profissao, :ensino, :celular, :email, :instagram, :observacao, :tipo_cadastro, :endereco_id)
    end
end

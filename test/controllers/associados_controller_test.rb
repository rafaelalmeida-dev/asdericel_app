require "test_helper"

class AssociadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @associado = associados(:one)
  end

  test "should get index" do
    get associados_url
    assert_response :success
  end

  test "should get new" do
    get new_associado_url
    assert_response :success
  end

  test "should create associado" do
    assert_difference("Associado.count") do
      post associados_url, params: { associado: { celular: @associado.celular, cpf: @associado.cpf, data_expedicao: @associado.data_expedicao, data_nascimento: @associado.data_nascimento, email: @associado.email, endereco_id: @associado.endereco_id, ensino: @associado.ensino, estado_civil: @associado.estado_civil, instagram: @associado.instagram, mae: @associado.mae, nome: @associado.nome, nome_conhecido: @associado.nome_conhecido, nome_social: @associado.nome_social, observacao: @associado.observacao, orgao_emissor: @associado.orgao_emissor, pai: @associado.pai, passaporte: @associado.passaporte, profissao: @associado.profissao, rg: @associado.rg, sexo: @associado.sexo, tipo_cadastro: @associado.tipo_cadastro } }
    end

    assert_redirected_to associado_url(Associado.last)
  end

  test "should show associado" do
    get associado_url(@associado)
    assert_response :success
  end

  test "should get edit" do
    get edit_associado_url(@associado)
    assert_response :success
  end

  test "should update associado" do
    patch associado_url(@associado), params: { associado: { celular: @associado.celular, cpf: @associado.cpf, data_expedicao: @associado.data_expedicao, data_nascimento: @associado.data_nascimento, email: @associado.email, endereco_id: @associado.endereco_id, ensino: @associado.ensino, estado_civil: @associado.estado_civil, instagram: @associado.instagram, mae: @associado.mae, nome: @associado.nome, nome_conhecido: @associado.nome_conhecido, nome_social: @associado.nome_social, observacao: @associado.observacao, orgao_emissor: @associado.orgao_emissor, pai: @associado.pai, passaporte: @associado.passaporte, profissao: @associado.profissao, rg: @associado.rg, sexo: @associado.sexo, tipo_cadastro: @associado.tipo_cadastro } }
    assert_redirected_to associado_url(@associado)
  end

  test "should destroy associado" do
    assert_difference("Associado.count", -1) do
      delete associado_url(@associado)
    end

    assert_redirected_to associados_url
  end
end

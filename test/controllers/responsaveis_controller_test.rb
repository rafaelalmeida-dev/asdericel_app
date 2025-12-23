require "test_helper"

class ResponsaveisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @responsavel = responsaveis(:one)
  end

  test "should get index" do
    get responsaveis_url
    assert_response :success
  end

  test "should get new" do
    get new_responsavel_url
    assert_response :success
  end

  test "should create responsavel" do
    assert_difference("Responsavel.count") do
      post responsaveis_url, params: { responsavel: { cpf: @responsavel.cpf, email: @responsavel.email, nome: @responsavel.nome, parentesco_id: @responsavel.parentesco_id, rg: @responsavel.rg, telefone: @responsavel.telefone } }
    end

    assert_redirected_to responsavel_url(Responsavel.last)
  end

  test "should show responsavel" do
    get responsavel_url(@responsavel)
    assert_response :success
  end

  test "should get edit" do
    get edit_responsavel_url(@responsavel)
    assert_response :success
  end

  test "should update responsavel" do
    patch responsavel_url(@responsavel), params: { responsavel: { cpf: @responsavel.cpf, email: @responsavel.email, nome: @responsavel.nome, parentesco_id: @responsavel.parentesco_id, rg: @responsavel.rg, telefone: @responsavel.telefone } }
    assert_redirected_to responsavel_url(@responsavel)
  end

  test "should destroy responsavel" do
    assert_difference("Responsavel.count", -1) do
      delete responsavel_url(@responsavel)
    end

    assert_redirected_to responsaveis_url
  end
end

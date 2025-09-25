require "test_helper"

class FederacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @federacao = federacaos(:one)
  end

  test "should get index" do
    get federacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_federacao_url
    assert_response :success
  end

  test "should create federacao" do
    assert_difference("Federacao.count") do
      post federacaos_url, params: { federacao: { nome: @federacao.nome, sigla: @federacao.sigla } }
    end

    assert_redirected_to federacao_url(Federacao.last)
  end

  test "should show federacao" do
    get federacao_url(@federacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_federacao_url(@federacao)
    assert_response :success
  end

  test "should update federacao" do
    patch federacao_url(@federacao), params: { federacao: { nome: @federacao.nome, sigla: @federacao.sigla } }
    assert_redirected_to federacao_url(@federacao)
  end

  test "should destroy federacao" do
    assert_difference("Federacao.count", -1) do
      delete federacao_url(@federacao)
    end

    assert_redirected_to federacaos_url
  end
end

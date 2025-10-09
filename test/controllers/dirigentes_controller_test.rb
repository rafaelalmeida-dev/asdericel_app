require "test_helper"

class DirigentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dirigente = dirigentes(:one)
  end

  test "should get index" do
    get dirigentes_url
    assert_response :success
  end

  test "should get new" do
    get new_dirigente_url
    assert_response :success
  end

  test "should create dirigente" do
    assert_difference("Dirigente.count") do
      post dirigentes_url, params: { dirigente: { cref: @dirigente.cref, federacao_id: @dirigente.federacao_id, modalidade_id: @dirigente.modalidade_id, pessoa_id: @dirigente.pessoa_id } }
    end

    assert_redirected_to dirigente_url(Dirigente.last)
  end

  test "should show dirigente" do
    get dirigente_url(@dirigente)
    assert_response :success
  end

  test "should get edit" do
    get edit_dirigente_url(@dirigente)
    assert_response :success
  end

  test "should update dirigente" do
    patch dirigente_url(@dirigente), params: { dirigente: { cref: @dirigente.cref, federacao_id: @dirigente.federacao_id, modalidade_id: @dirigente.modalidade_id, pessoa_id: @dirigente.pessoa_id } }
    assert_redirected_to dirigente_url(@dirigente)
  end

  test "should destroy dirigente" do
    assert_difference("Dirigente.count", -1) do
      delete dirigente_url(@dirigente)
    end

    assert_redirected_to dirigentes_url
  end
end

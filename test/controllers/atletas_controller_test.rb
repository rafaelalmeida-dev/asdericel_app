require "test_helper"

class AtletasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atleta = atletas(:one)
  end

  test "should get index" do
    get atletas_url
    assert_response :success
  end

  test "should get new" do
    get new_atleta_url
    assert_response :success
  end

  test "should create atleta" do
    assert_difference("Atleta.count") do
      post atletas_url, params: { atleta: { altura: @atleta.altura, calca_id: @atleta.calca_id, camisa_id: @atleta.camisa_id, numeroSus: @atleta.numeroSus, peso: @atleta.peso, pessoa_id: @atleta.pessoa_id } }
    end

    assert_redirected_to atleta_url(Atleta.last)
  end

  test "should show atleta" do
    get atleta_url(@atleta)
    assert_response :success
  end

  test "should get edit" do
    get edit_atleta_url(@atleta)
    assert_response :success
  end

  test "should update atleta" do
    patch atleta_url(@atleta), params: { atleta: { altura: @atleta.altura, calca_id: @atleta.calca_id, camisa_id: @atleta.camisa_id, numeroSus: @atleta.numeroSus, peso: @atleta.peso, pessoa_id: @atleta.pessoa_id } }
    assert_redirected_to atleta_url(@atleta)
  end

  test "should destroy atleta" do
    assert_difference("Atleta.count", -1) do
      delete atleta_url(@atleta)
    end

    assert_redirected_to atletas_url
  end
end

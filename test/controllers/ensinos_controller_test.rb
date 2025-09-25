require "test_helper"

class EnsinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ensino = ensinos(:one)
  end

  test "should get index" do
    get ensinos_url
    assert_response :success
  end

  test "should get new" do
    get new_ensino_url
    assert_response :success
  end

  test "should create ensino" do
    assert_difference("Ensino.count") do
      post ensinos_url, params: { ensino: { nome: @ensino.nome } }
    end

    assert_redirected_to ensino_url(Ensino.last)
  end

  test "should show ensino" do
    get ensino_url(@ensino)
    assert_response :success
  end

  test "should get edit" do
    get edit_ensino_url(@ensino)
    assert_response :success
  end

  test "should update ensino" do
    patch ensino_url(@ensino), params: { ensino: { nome: @ensino.nome } }
    assert_redirected_to ensino_url(@ensino)
  end

  test "should destroy ensino" do
    assert_difference("Ensino.count", -1) do
      delete ensino_url(@ensino)
    end

    assert_redirected_to ensinos_url
  end
end

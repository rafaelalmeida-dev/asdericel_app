require "test_helper"

class TiposanguineosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiposanguineo = tiposanguineos(:one)
  end

  test "should get index" do
    get tiposanguineos_url
    assert_response :success
  end

  test "should get new" do
    get new_tiposanguineo_url
    assert_response :success
  end

  test "should create tiposanguineo" do
    assert_difference("Tiposanguineo.count") do
      post tiposanguineos_url, params: { tiposanguineo: { nome: @tiposanguineo.nome } }
    end

    assert_redirected_to tiposanguineo_url(Tiposanguineo.last)
  end

  test "should show tiposanguineo" do
    get tiposanguineo_url(@tiposanguineo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tiposanguineo_url(@tiposanguineo)
    assert_response :success
  end

  test "should update tiposanguineo" do
    patch tiposanguineo_url(@tiposanguineo), params: { tiposanguineo: { nome: @tiposanguineo.nome } }
    assert_redirected_to tiposanguineo_url(@tiposanguineo)
  end

  test "should destroy tiposanguineo" do
    assert_difference("Tiposanguineo.count", -1) do
      delete tiposanguineo_url(@tiposanguineo)
    end

    assert_redirected_to tiposanguineos_url
  end
end

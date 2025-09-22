require "test_helper"

class EstadocivilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estadocivil = estadocivils(:one)
  end

  test "should get index" do
    get estadocivils_url
    assert_response :success
  end

  test "should get new" do
    get new_estadocivil_url
    assert_response :success
  end

  test "should create estadocivil" do
    assert_difference("Estadocivil.count") do
      post estadocivils_url, params: { estadocivil: { nome: @estadocivil.nome } }
    end

    assert_redirected_to estadocivil_url(Estadocivil.last)
  end

  test "should show estadocivil" do
    get estadocivil_url(@estadocivil)
    assert_response :success
  end

  test "should get edit" do
    get edit_estadocivil_url(@estadocivil)
    assert_response :success
  end

  test "should update estadocivil" do
    patch estadocivil_url(@estadocivil), params: { estadocivil: { nome: @estadocivil.nome } }
    assert_redirected_to estadocivil_url(@estadocivil)
  end

  test "should destroy estadocivil" do
    assert_difference("Estadocivil.count", -1) do
      delete estadocivil_url(@estadocivil)
    end

    assert_redirected_to estadocivils_url
  end
end

require "test_helper"

class CamisasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camisa = camisas(:one)
  end

  test "should get index" do
    get camisas_url
    assert_response :success
  end

  test "should get new" do
    get new_camisa_url
    assert_response :success
  end

  test "should create camisa" do
    assert_difference("Camisa.count") do
      post camisas_url, params: { camisa: { numero: @camisa.numero } }
    end

    assert_redirected_to camisa_url(Camisa.last)
  end

  test "should show camisa" do
    get camisa_url(@camisa)
    assert_response :success
  end

  test "should get edit" do
    get edit_camisa_url(@camisa)
    assert_response :success
  end

  test "should update camisa" do
    patch camisa_url(@camisa), params: { camisa: { numero: @camisa.numero } }
    assert_redirected_to camisa_url(@camisa)
  end

  test "should destroy camisa" do
    assert_difference("Camisa.count", -1) do
      delete camisa_url(@camisa)
    end

    assert_redirected_to camisas_url
  end
end

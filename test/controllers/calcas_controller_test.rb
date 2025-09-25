require "test_helper"

class CalcasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calca = calcas(:one)
  end

  test "should get index" do
    get calcas_url
    assert_response :success
  end

  test "should get new" do
    get new_calca_url
    assert_response :success
  end

  test "should create calca" do
    assert_difference("Calca.count") do
      post calcas_url, params: { calca: { numero: @calca.numero } }
    end

    assert_redirected_to calca_url(Calca.last)
  end

  test "should show calca" do
    get calca_url(@calca)
    assert_response :success
  end

  test "should get edit" do
    get edit_calca_url(@calca)
    assert_response :success
  end

  test "should update calca" do
    patch calca_url(@calca), params: { calca: { numero: @calca.numero } }
    assert_redirected_to calca_url(@calca)
  end

  test "should destroy calca" do
    assert_difference("Calca.count", -1) do
      delete calca_url(@calca)
    end

    assert_redirected_to calcas_url
  end
end

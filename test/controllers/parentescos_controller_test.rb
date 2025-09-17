require "test_helper"

class ParentescosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parentesco = parentescos(:one)
  end

  test "should get index" do
    get parentescos_url
    assert_response :success
  end

  test "should get new" do
    get new_parentesco_url
    assert_response :success
  end

  test "should create parentesco" do
    assert_difference("Parentesco.count") do
      post parentescos_url, params: { parentesco: { nome: @parentesco.nome } }
    end

    assert_redirected_to parentesco_url(Parentesco.last)
  end

  test "should show parentesco" do
    get parentesco_url(@parentesco)
    assert_response :success
  end

  test "should get edit" do
    get edit_parentesco_url(@parentesco)
    assert_response :success
  end

  test "should update parentesco" do
    patch parentesco_url(@parentesco), params: { parentesco: { nome: @parentesco.nome } }
    assert_redirected_to parentesco_url(@parentesco)
  end

  test "should destroy parentesco" do
    assert_difference("Parentesco.count", -1) do
      delete parentesco_url(@parentesco)
    end

    assert_redirected_to parentescos_url
  end
end

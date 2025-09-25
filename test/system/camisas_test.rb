require "application_system_test_case"

class CamisasTest < ApplicationSystemTestCase
  setup do
    @camisa = camisas(:one)
  end

  test "visiting the index" do
    visit camisas_url
    assert_selector "h1", text: "Camisas"
  end

  test "should create camisa" do
    visit camisas_url
    click_on "New camisa"

    fill_in "Numero", with: @camisa.numero
    click_on "Create Camisa"

    assert_text "Camisa was successfully created"
    click_on "Back"
  end

  test "should update Camisa" do
    visit camisa_url(@camisa)
    click_on "Edit this camisa", match: :first

    fill_in "Numero", with: @camisa.numero
    click_on "Update Camisa"

    assert_text "Camisa was successfully updated"
    click_on "Back"
  end

  test "should destroy Camisa" do
    visit camisa_url(@camisa)
    click_on "Destroy this camisa", match: :first

    assert_text "Camisa was successfully destroyed"
  end
end

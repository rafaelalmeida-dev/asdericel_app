require "application_system_test_case"

class CalcasTest < ApplicationSystemTestCase
  setup do
    @calca = calcas(:one)
  end

  test "visiting the index" do
    visit calcas_url
    assert_selector "h1", text: "Calcas"
  end

  test "should create calca" do
    visit calcas_url
    click_on "New calca"

    fill_in "Numero", with: @calca.numero
    click_on "Create Calca"

    assert_text "Calca was successfully created"
    click_on "Back"
  end

  test "should update Calca" do
    visit calca_url(@calca)
    click_on "Edit this calca", match: :first

    fill_in "Numero", with: @calca.numero
    click_on "Update Calca"

    assert_text "Calca was successfully updated"
    click_on "Back"
  end

  test "should destroy Calca" do
    visit calca_url(@calca)
    click_on "Destroy this calca", match: :first

    assert_text "Calca was successfully destroyed"
  end
end

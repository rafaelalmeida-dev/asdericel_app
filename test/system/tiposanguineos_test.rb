require "application_system_test_case"

class TiposanguineosTest < ApplicationSystemTestCase
  setup do
    @tiposanguineo = tiposanguineos(:one)
  end

  test "visiting the index" do
    visit tiposanguineos_url
    assert_selector "h1", text: "Tiposanguineos"
  end

  test "should create tiposanguineo" do
    visit tiposanguineos_url
    click_on "New tiposanguineo"

    fill_in "Nome", with: @tiposanguineo.nome
    click_on "Create Tiposanguineo"

    assert_text "Tiposanguineo was successfully created"
    click_on "Back"
  end

  test "should update Tiposanguineo" do
    visit tiposanguineo_url(@tiposanguineo)
    click_on "Edit this tiposanguineo", match: :first

    fill_in "Nome", with: @tiposanguineo.nome
    click_on "Update Tiposanguineo"

    assert_text "Tiposanguineo was successfully updated"
    click_on "Back"
  end

  test "should destroy Tiposanguineo" do
    visit tiposanguineo_url(@tiposanguineo)
    click_on "Destroy this tiposanguineo", match: :first

    assert_text "Tiposanguineo was successfully destroyed"
  end
end

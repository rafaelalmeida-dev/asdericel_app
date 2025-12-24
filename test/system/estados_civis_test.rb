require "application_system_test_case"

class EstadoCivilsTest < ApplicationSystemTestCase
  setup do
    @estado_civil = estados_civis(:one)
  end

  test "visiting the index" do
    visit estados_civis_url
    assert_selector "h1", text: "Estado civils"
  end

  test "should create estado civil" do
    visit estados_civis_url
    click_on "New estado civil"

    fill_in "Nome", with: @estado_civil.nome
    click_on "Create Estado civil"

    assert_text "Estado civil was successfully created"
    click_on "Back"
  end

  test "should update Estado civil" do
    visit estado_civil_url(@estado_civil)
    click_on "Edit this estado civil", match: :first

    fill_in "Nome", with: @estado_civil.nome
    click_on "Update Estado civil"

    assert_text "Estado civil was successfully updated"
    click_on "Back"
  end

  test "should destroy Estado civil" do
    visit estado_civil_url(@estado_civil)
    click_on "Destroy this estado civil", match: :first

    assert_text "Estado civil was successfully destroyed"
  end
end

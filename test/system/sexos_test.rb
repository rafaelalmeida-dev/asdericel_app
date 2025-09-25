require "application_system_test_case"

class SexosTest < ApplicationSystemTestCase
  setup do
    @sexo = sexos(:one)
  end

  test "visiting the index" do
    visit sexos_url
    assert_selector "h1", text: "Sexos"
  end

  test "should create sexo" do
    visit sexos_url
    click_on "New sexo"

    fill_in "Nome", with: @sexo.nome
    click_on "Create Sexo"

    assert_text "Sexo was successfully created"
    click_on "Back"
  end

  test "should update Sexo" do
    visit sexo_url(@sexo)
    click_on "Edit this sexo", match: :first

    fill_in "Nome", with: @sexo.nome
    click_on "Update Sexo"

    assert_text "Sexo was successfully updated"
    click_on "Back"
  end

  test "should destroy Sexo" do
    visit sexo_url(@sexo)
    click_on "Destroy this sexo", match: :first

    assert_text "Sexo was successfully destroyed"
  end
end

require "application_system_test_case"

class DirigentesTest < ApplicationSystemTestCase
  setup do
    @dirigente = dirigentes(:one)
  end

  test "visiting the index" do
    visit dirigentes_url
    assert_selector "h1", text: "Dirigentes"
  end

  test "should create dirigente" do
    visit dirigentes_url
    click_on "New dirigente"

    fill_in "Cref", with: @dirigente.cref
    fill_in "Federacao", with: @dirigente.federacao_id
    fill_in "Modalidade", with: @dirigente.modalidade_id
    fill_in "Pessoa", with: @dirigente.pessoa_id
    click_on "Create Dirigente"

    assert_text "Dirigente was successfully created"
    click_on "Back"
  end

  test "should update Dirigente" do
    visit dirigente_url(@dirigente)
    click_on "Edit this dirigente", match: :first

    fill_in "Cref", with: @dirigente.cref
    fill_in "Federacao", with: @dirigente.federacao_id
    fill_in "Modalidade", with: @dirigente.modalidade_id
    fill_in "Pessoa", with: @dirigente.pessoa_id
    click_on "Update Dirigente"

    assert_text "Dirigente was successfully updated"
    click_on "Back"
  end

  test "should destroy Dirigente" do
    visit dirigente_url(@dirigente)
    click_on "Destroy this dirigente", match: :first

    assert_text "Dirigente was successfully destroyed"
  end
end

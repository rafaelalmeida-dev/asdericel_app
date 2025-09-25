require "application_system_test_case"

class EscolasTest < ApplicationSystemTestCase
  setup do
    @escola = escolas(:one)
  end

  test "visiting the index" do
    visit escolas_url
    assert_selector "h1", text: "Escolas"
  end

  test "should create escola" do
    visit escolas_url
    click_on "New escola"

    fill_in "Estado", with: @escola.estado
    fill_in "Inep", with: @escola.inep
    fill_in "Municipio", with: @escola.municipio
    fill_in "Nome", with: @escola.nome
    fill_in "Telefone", with: @escola.telefone
    click_on "Create Escola"

    assert_text "Escola was successfully created"
    click_on "Back"
  end

  test "should update Escola" do
    visit escola_url(@escola)
    click_on "Edit this escola", match: :first

    fill_in "Estado", with: @escola.estado
    fill_in "Inep", with: @escola.inep
    fill_in "Municipio", with: @escola.municipio
    fill_in "Nome", with: @escola.nome
    fill_in "Telefone", with: @escola.telefone
    click_on "Update Escola"

    assert_text "Escola was successfully updated"
    click_on "Back"
  end

  test "should destroy Escola" do
    visit escola_url(@escola)
    click_on "Destroy this escola", match: :first

    assert_text "Escola was successfully destroyed"
  end
end

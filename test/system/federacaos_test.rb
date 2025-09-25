require "application_system_test_case"

class FederacaosTest < ApplicationSystemTestCase
  setup do
    @federacao = federacaos(:one)
  end

  test "visiting the index" do
    visit federacaos_url
    assert_selector "h1", text: "Federacaos"
  end

  test "should create federacao" do
    visit federacaos_url
    click_on "New federacao"

    fill_in "Nome", with: @federacao.nome
    fill_in "Sigla", with: @federacao.sigla
    click_on "Create Federacao"

    assert_text "Federacao was successfully created"
    click_on "Back"
  end

  test "should update Federacao" do
    visit federacao_url(@federacao)
    click_on "Edit this federacao", match: :first

    fill_in "Nome", with: @federacao.nome
    fill_in "Sigla", with: @federacao.sigla
    click_on "Update Federacao"

    assert_text "Federacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Federacao" do
    visit federacao_url(@federacao)
    click_on "Destroy this federacao", match: :first

    assert_text "Federacao was successfully destroyed"
  end
end

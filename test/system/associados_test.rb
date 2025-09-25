require "application_system_test_case"

class AssociadosTest < ApplicationSystemTestCase
  setup do
    @associado = associados(:one)
  end

  test "visiting the index" do
    visit associados_url
    assert_selector "h1", text: "Associados"
  end

  test "should create associado" do
    visit associados_url
    click_on "New associado"

    fill_in "Celular", with: @associado.celular
    fill_in "Email", with: @associado.email
    fill_in "Instagram", with: @associado.instagram
    fill_in "Observacao", with: @associado.observacao
    fill_in "Pessoa", with: @associado.pessoa_id
    click_on "Create Associado"

    assert_text "Associado was successfully created"
    click_on "Back"
  end

  test "should update Associado" do
    visit associado_url(@associado)
    click_on "Edit this associado", match: :first

    fill_in "Celular", with: @associado.celular
    fill_in "Email", with: @associado.email
    fill_in "Instagram", with: @associado.instagram
    fill_in "Observacao", with: @associado.observacao
    fill_in "Pessoa", with: @associado.pessoa_id
    click_on "Update Associado"

    assert_text "Associado was successfully updated"
    click_on "Back"
  end

  test "should destroy Associado" do
    visit associado_url(@associado)
    click_on "Destroy this associado", match: :first

    assert_text "Associado was successfully destroyed"
  end
end

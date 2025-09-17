require "application_system_test_case"

class ResponsavelsTest < ApplicationSystemTestCase
  setup do
    @responsavel = responsavels(:one)
  end

  test "visiting the index" do
    visit responsavels_url
    assert_selector "h1", text: "Responsavels"
  end

  test "should create responsavel" do
    visit responsavels_url
    click_on "New responsavel"

    fill_in "Cpf", with: @responsavel.cpf
    fill_in "Email", with: @responsavel.email
    fill_in "Nome", with: @responsavel.nome
    fill_in "Parentesco", with: @responsavel.parentesco_id
    fill_in "Rg", with: @responsavel.rg
    fill_in "Telefone", with: @responsavel.telefone
    click_on "Create Responsavel"

    assert_text "Responsavel was successfully created"
    click_on "Back"
  end

  test "should update Responsavel" do
    visit responsavel_url(@responsavel)
    click_on "Edit this responsavel", match: :first

    fill_in "Cpf", with: @responsavel.cpf
    fill_in "Email", with: @responsavel.email
    fill_in "Nome", with: @responsavel.nome
    fill_in "Parentesco", with: @responsavel.parentesco_id
    fill_in "Rg", with: @responsavel.rg
    fill_in "Telefone", with: @responsavel.telefone
    click_on "Update Responsavel"

    assert_text "Responsavel was successfully updated"
    click_on "Back"
  end

  test "should destroy Responsavel" do
    visit responsavel_url(@responsavel)
    click_on "Destroy this responsavel", match: :first

    assert_text "Responsavel was successfully destroyed"
  end
end

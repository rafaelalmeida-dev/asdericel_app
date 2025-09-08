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
    fill_in "Cpf", with: @associado.cpf
    fill_in "Data expedicao", with: @associado.data_expedicao
    fill_in "Data nascimento", with: @associado.data_nascimento
    fill_in "Email", with: @associado.email
    fill_in "Endereco", with: @associado.endereco_id
    fill_in "Ensino", with: @associado.ensino
    fill_in "Estado civil", with: @associado.estado_civil
    fill_in "Instagram", with: @associado.instagram
    fill_in "Mae", with: @associado.mae
    fill_in "Nome", with: @associado.nome
    fill_in "Nome conhecido", with: @associado.nome_conhecido
    fill_in "Nome social", with: @associado.nome_social
    fill_in "Observacao", with: @associado.observacao
    fill_in "Orgao emissor", with: @associado.orgao_emissor
    fill_in "Pai", with: @associado.pai
    fill_in "Passaporte", with: @associado.passaporte
    fill_in "Profissao", with: @associado.profissao
    fill_in "Rg", with: @associado.rg
    fill_in "Sexo", with: @associado.sexo
    fill_in "Tipo cadastro", with: @associado.tipo_cadastro
    click_on "Create Associado"

    assert_text "Associado was successfully created"
    click_on "Back"
  end

  test "should update Associado" do
    visit associado_url(@associado)
    click_on "Edit this associado", match: :first

    fill_in "Celular", with: @associado.celular
    fill_in "Cpf", with: @associado.cpf
    fill_in "Data expedicao", with: @associado.data_expedicao
    fill_in "Data nascimento", with: @associado.data_nascimento
    fill_in "Email", with: @associado.email
    fill_in "Endereco", with: @associado.endereco_id
    fill_in "Ensino", with: @associado.ensino
    fill_in "Estado civil", with: @associado.estado_civil
    fill_in "Instagram", with: @associado.instagram
    fill_in "Mae", with: @associado.mae
    fill_in "Nome", with: @associado.nome
    fill_in "Nome conhecido", with: @associado.nome_conhecido
    fill_in "Nome social", with: @associado.nome_social
    fill_in "Observacao", with: @associado.observacao
    fill_in "Orgao emissor", with: @associado.orgao_emissor
    fill_in "Pai", with: @associado.pai
    fill_in "Passaporte", with: @associado.passaporte
    fill_in "Profissao", with: @associado.profissao
    fill_in "Rg", with: @associado.rg
    fill_in "Sexo", with: @associado.sexo
    fill_in "Tipo cadastro", with: @associado.tipo_cadastro
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

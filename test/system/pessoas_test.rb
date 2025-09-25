require "application_system_test_case"

class PessoasTest < ApplicationSystemTestCase
  setup do
    @pessoa = pessoas(:one)
  end

  test "visiting the index" do
    visit pessoas_url
    assert_selector "h1", text: "Pessoas"
  end

  test "should create pessoa" do
    visit pessoas_url
    click_on "New pessoa"

    fill_in "Cinrg", with: @pessoa.cinrg
    fill_in "Cpf", with: @pessoa.cpf
    fill_in "Dataexpedicao", with: @pessoa.dataexpedicao
    fill_in "Datanascimento", with: @pessoa.datanascimento
    fill_in "Ensino", with: @pessoa.ensino_id
    fill_in "Estadocivil", with: @pessoa.estadocivil_id
    fill_in "Funcao", with: @pessoa.funcao_id
    fill_in "Mae", with: @pessoa.mae
    fill_in "Nome", with: @pessoa.nome
    fill_in "Nomeconhecido", with: @pessoa.nomeconhecido
    fill_in "Nomesocial", with: @pessoa.nomesocial
    fill_in "Orgaoemissor", with: @pessoa.orgaoemissor
    fill_in "Pai", with: @pessoa.pai
    fill_in "Passaporte", with: @pessoa.passaporte
    fill_in "Profissao", with: @pessoa.profissao
    fill_in "Sexo", with: @pessoa.sexo_id
    click_on "Create Pessoa"

    assert_text "Pessoa was successfully created"
    click_on "Back"
  end

  test "should update Pessoa" do
    visit pessoa_url(@pessoa)
    click_on "Edit this pessoa", match: :first

    fill_in "Cinrg", with: @pessoa.cinrg
    fill_in "Cpf", with: @pessoa.cpf
    fill_in "Dataexpedicao", with: @pessoa.dataexpedicao
    fill_in "Datanascimento", with: @pessoa.datanascimento
    fill_in "Ensino", with: @pessoa.ensino_id
    fill_in "Estadocivil", with: @pessoa.estadocivil_id
    fill_in "Funcao", with: @pessoa.funcao_id
    fill_in "Mae", with: @pessoa.mae
    fill_in "Nome", with: @pessoa.nome
    fill_in "Nomeconhecido", with: @pessoa.nomeconhecido
    fill_in "Nomesocial", with: @pessoa.nomesocial
    fill_in "Orgaoemissor", with: @pessoa.orgaoemissor
    fill_in "Pai", with: @pessoa.pai
    fill_in "Passaporte", with: @pessoa.passaporte
    fill_in "Profissao", with: @pessoa.profissao
    fill_in "Sexo", with: @pessoa.sexo_id
    click_on "Update Pessoa"

    assert_text "Pessoa was successfully updated"
    click_on "Back"
  end

  test "should destroy Pessoa" do
    visit pessoa_url(@pessoa)
    click_on "Destroy this pessoa", match: :first

    assert_text "Pessoa was successfully destroyed"
  end
end

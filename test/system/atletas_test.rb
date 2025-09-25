require "application_system_test_case"

class AtletasTest < ApplicationSystemTestCase
  setup do
    @atleta = atletas(:one)
  end

  test "visiting the index" do
    visit atletas_url
    assert_selector "h1", text: "Atletas"
  end

  test "should create atleta" do
    visit atletas_url
    click_on "New atleta"

    fill_in "Altura", with: @atleta.altura
    fill_in "Calca", with: @atleta.calca_id
    fill_in "Camisa", with: @atleta.camisa_id
    fill_in "Numerosus", with: @atleta.numeroSus
    fill_in "Peso", with: @atleta.peso
    fill_in "Pessoa", with: @atleta.pessoa_id
    click_on "Create Atleta"

    assert_text "Atleta was successfully created"
    click_on "Back"
  end

  test "should update Atleta" do
    visit atleta_url(@atleta)
    click_on "Edit this atleta", match: :first

    fill_in "Altura", with: @atleta.altura
    fill_in "Calca", with: @atleta.calca_id
    fill_in "Camisa", with: @atleta.camisa_id
    fill_in "Numerosus", with: @atleta.numeroSus
    fill_in "Peso", with: @atleta.peso
    fill_in "Pessoa", with: @atleta.pessoa_id
    click_on "Update Atleta"

    assert_text "Atleta was successfully updated"
    click_on "Back"
  end

  test "should destroy Atleta" do
    visit atleta_url(@atleta)
    click_on "Destroy this atleta", match: :first

    assert_text "Atleta was successfully destroyed"
  end
end

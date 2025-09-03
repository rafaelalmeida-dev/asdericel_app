require "application_system_test_case"

class EventosTest < ApplicationSystemTestCase
  setup do
    @evento = eventos(:one)
  end

  test "visiting the index" do
    visit eventos_url
    assert_selector "h1", text: "Eventos"
  end

  test "should create evento" do
    visit eventos_url
    click_on "New evento"

    fill_in "Categoria", with: @evento.categoria
    fill_in "Edicao", with: @evento.edicao
    fill_in "Estado", with: @evento.estado
    fill_in "Municipio", with: @evento.municipio
    fill_in "Nome", with: @evento.nome
    fill_in "Pais", with: @evento.pais
    click_on "Create Evento"

    assert_text "Evento was successfully created"
    click_on "Back"
  end

  test "should update Evento" do
    visit evento_url(@evento)
    click_on "Edit this evento", match: :first

    fill_in "Categoria", with: @evento.categoria
    fill_in "Edicao", with: @evento.edicao
    fill_in "Estado", with: @evento.estado
    fill_in "Municipio", with: @evento.municipio
    fill_in "Nome", with: @evento.nome
    fill_in "Pais", with: @evento.pais
    click_on "Update Evento"

    assert_text "Evento was successfully updated"
    click_on "Back"
  end

  test "should destroy Evento" do
    visit evento_url(@evento)
    click_on "Destroy this evento", match: :first

    assert_text "Evento was successfully destroyed"
  end
end

require "application_system_test_case"

class NoticiaTest < ApplicationSystemTestCase
  setup do
    @noticium = noticia(:one)
  end

  test "visiting the index" do
    visit noticia_url
    assert_selector "h1", text: "Noticia"
  end

  test "should create noticium" do
    visit noticia_url
    click_on "New noticium"

    fill_in "Categoria", with: @noticium.categoria
    fill_in "Conteudo", with: @noticium.conteudo
    fill_in "Data publicacao", with: @noticium.data_publicacao
    check "Destaque" if @noticium.destaque
    fill_in "Imagem", with: @noticium.imagem
    fill_in "Titulo", with: @noticium.titulo
    click_on "Create Noticium"

    assert_text "Noticium was successfully created"
    click_on "Back"
  end

  test "should update Noticium" do
    visit noticium_url(@noticium)
    click_on "Edit this noticium", match: :first

    fill_in "Categoria", with: @noticium.categoria
    fill_in "Conteudo", with: @noticium.conteudo
    fill_in "Data publicacao", with: @noticium.data_publicacao
    check "Destaque" if @noticium.destaque
    fill_in "Imagem", with: @noticium.imagem
    fill_in "Titulo", with: @noticium.titulo
    click_on "Update Noticium"

    assert_text "Noticium was successfully updated"
    click_on "Back"
  end

  test "should destroy Noticium" do
    visit noticium_url(@noticium)
    click_on "Destroy this noticium", match: :first

    assert_text "Noticium was successfully destroyed"
  end
end

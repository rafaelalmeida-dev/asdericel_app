require "application_system_test_case"

class NoticiasTest < ApplicationSystemTestCase
  setup do
    @noticia = noticia(:one)
  end

  test "visiting the index" do
    visit noticia_url
    assert_selector "h1", text: "Noticia"
  end

  test "should create noticia" do
    visit noticia_url
    click_on "New noticia"

    fill_in "Categoria", with: @noticia.categoria
    fill_in "Conteudo", with: @noticia.conteudo
    fill_in "Data publicacao", with: @noticia.data_publicacao
    check "Destaque" if @noticia.destaque
    fill_in "Imagem", with: @noticia.imagem
    fill_in "Titulo", with: @noticia.titulo
    click_on "Create Noticia"

    assert_text "Noticia was successfully created"
    click_on "Back"
  end

  test "should update Noticia" do
    visit noticia_url(@noticia)
    click_on "Edit this noticia", match: :first

    fill_in "Categoria", with: @noticia.categoria
    fill_in "Conteudo", with: @noticia.conteudo
    fill_in "Data publicacao", with: @noticia.data_publicacao
    check "Destaque" if @noticia.destaque
    fill_in "Imagem", with: @noticia.imagem
    fill_in "Titulo", with: @noticia.titulo
    click_on "Update Noticia"

    assert_text "Noticia was successfully updated"
    click_on "Back"
  end

  test "should destroy Noticia" do
    visit noticia_url(@noticia)
    click_on "Destroy this noticia", match: :first

    assert_text "Noticia was successfully destroyed"
  end
end

require "application_system_test_case"

class EnsinosTest < ApplicationSystemTestCase
  setup do
    @ensino = ensinos(:one)
  end

  test "visiting the index" do
    visit ensinos_url
    assert_selector "h1", text: "Ensinos"
  end

  test "should create ensino" do
    visit ensinos_url
    click_on "New ensino"

    fill_in "Nome", with: @ensino.nome
    click_on "Create Ensino"

    assert_text "Ensino was successfully created"
    click_on "Back"
  end

  test "should update Ensino" do
    visit ensino_url(@ensino)
    click_on "Edit this ensino", match: :first

    fill_in "Nome", with: @ensino.nome
    click_on "Update Ensino"

    assert_text "Ensino was successfully updated"
    click_on "Back"
  end

  test "should destroy Ensino" do
    visit ensino_url(@ensino)
    click_on "Destroy this ensino", match: :first

    assert_text "Ensino was successfully destroyed"
  end
end

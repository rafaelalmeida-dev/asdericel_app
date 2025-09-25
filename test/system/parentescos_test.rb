require "application_system_test_case"

class ParentescosTest < ApplicationSystemTestCase
  setup do
    @parentesco = parentescos(:one)
  end

  test "visiting the index" do
    visit parentescos_url
    assert_selector "h1", text: "Parentescos"
  end

  test "should create parentesco" do
    visit parentescos_url
    click_on "New parentesco"

    fill_in "Nome", with: @parentesco.nome
    click_on "Create Parentesco"

    assert_text "Parentesco was successfully created"
    click_on "Back"
  end

  test "should update Parentesco" do
    visit parentesco_url(@parentesco)
    click_on "Edit this parentesco", match: :first

    fill_in "Nome", with: @parentesco.nome
    click_on "Update Parentesco"

    assert_text "Parentesco was successfully updated"
    click_on "Back"
  end

  test "should destroy Parentesco" do
    visit parentesco_url(@parentesco)
    click_on "Destroy this parentesco", match: :first

    assert_text "Parentesco was successfully destroyed"
  end
end

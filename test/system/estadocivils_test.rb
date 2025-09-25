require "application_system_test_case"

class EstadocivilsTest < ApplicationSystemTestCase
  setup do
    @estadocivil = estadocivils(:one)
  end

  test "visiting the index" do
    visit estadocivils_url
    assert_selector "h1", text: "Estadocivils"
  end

  test "should create estadocivil" do
    visit estadocivils_url
    click_on "New estadocivil"

    fill_in "Nome", with: @estadocivil.nome
    click_on "Create Estadocivil"

    assert_text "Estadocivil was successfully created"
    click_on "Back"
  end

  test "should update Estadocivil" do
    visit estadocivil_url(@estadocivil)
    click_on "Edit this estadocivil", match: :first

    fill_in "Nome", with: @estadocivil.nome
    click_on "Update Estadocivil"

    assert_text "Estadocivil was successfully updated"
    click_on "Back"
  end

  test "should destroy Estadocivil" do
    visit estadocivil_url(@estadocivil)
    click_on "Destroy this estadocivil", match: :first

    assert_text "Estadocivil was successfully destroyed"
  end
end

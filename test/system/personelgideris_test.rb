require "application_system_test_case"

class PersonelgiderisTest < ApplicationSystemTestCase
  setup do
    @personelgideri = personelgideris(:one)
  end

  test "visiting the index" do
    visit personelgideris_url
    assert_selector "h1", text: "Personelgideris"
  end

  test "creating a Personelgideri" do
    visit personelgideris_url
    click_on "New Personelgideri"

    fill_in "Maas", with: @personelgideri.maas
    fill_in "Sigorta", with: @personelgideri.sigorta
    click_on "Create Personelgideri"

    assert_text "Personelgideri was successfully created"
    click_on "Back"
  end

  test "updating a Personelgideri" do
    visit personelgideris_url
    click_on "Edit", match: :first

    fill_in "Maas", with: @personelgideri.maas
    fill_in "Sigorta", with: @personelgideri.sigorta
    click_on "Update Personelgideri"

    assert_text "Personelgideri was successfully updated"
    click_on "Back"
  end

  test "destroying a Personelgideri" do
    visit personelgideris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personelgideri was successfully destroyed"
  end
end

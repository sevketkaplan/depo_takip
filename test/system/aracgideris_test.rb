require "application_system_test_case"

class AracgiderisTest < ApplicationSystemTestCase
  setup do
    @aracgideri = aracgideris(:one)
  end

  test "visiting the index" do
    visit aracgideris_url
    assert_selector "h1", text: "Aracgideris"
  end

  test "creating a Aracgideri" do
    visit aracgideris_url
    click_on "New Aracgideri"

    fill_in "Bakim", with: @aracgideri.bakim
    fill_in "Kasko", with: @aracgideri.kasko
    fill_in "Mtv", with: @aracgideri.mtv
    fill_in "Plaka", with: @aracgideri.plaka
    fill_in "Sigorta", with: @aracgideri.sigorta
    fill_in "Yakit", with: @aracgideri.yakit
    click_on "Create Aracgideri"

    assert_text "Aracgideri was successfully created"
    click_on "Back"
  end

  test "updating a Aracgideri" do
    visit aracgideris_url
    click_on "Edit", match: :first

    fill_in "Bakim", with: @aracgideri.bakim
    fill_in "Kasko", with: @aracgideri.kasko
    fill_in "Mtv", with: @aracgideri.mtv
    fill_in "Plaka", with: @aracgideri.plaka
    fill_in "Sigorta", with: @aracgideri.sigorta
    fill_in "Yakit", with: @aracgideri.yakit
    click_on "Update Aracgideri"

    assert_text "Aracgideri was successfully updated"
    click_on "Back"
  end

  test "destroying a Aracgideri" do
    visit aracgideris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aracgideri was successfully destroyed"
  end
end

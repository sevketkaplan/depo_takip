require "application_system_test_case"

class AracsTest < ApplicationSystemTestCase
  setup do
    @arac = aracs(:one)
  end

  test "visiting the index" do
    visit aracs_url
    assert_selector "h1", text: "Aracs"
  end

  test "creating a Arac" do
    visit aracs_url
    click_on "New Arac"

    fill_in "Plaka", with: @arac.plaka
    click_on "Create Arac"

    assert_text "Arac was successfully created"
    click_on "Back"
  end

  test "updating a Arac" do
    visit aracs_url
    click_on "Edit", match: :first

    fill_in "Plaka", with: @arac.plaka
    click_on "Update Arac"

    assert_text "Arac was successfully updated"
    click_on "Back"
  end

  test "destroying a Arac" do
    visit aracs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arac was successfully destroyed"
  end
end

require "application_system_test_case"

class OdemesTest < ApplicationSystemTestCase
  setup do
    @odeme = odemes(:one)
  end

  test "visiting the index" do
    visit odemes_url
    assert_selector "h1", text: "Odemes"
  end

  test "creating a Odeme" do
    visit odemes_url
    click_on "New Odeme"

    fill_in "Dagitici", with: @odeme.dagitici
    fill_in "Date", with: @odeme.date
    fill_in "Odeme Miktari", with: @odeme.odeme_miktari
    fill_in "Teslim Yeri", with: @odeme.teslim_yeri
    click_on "Create Odeme"

    assert_text "Odeme was successfully created"
    click_on "Back"
  end

  test "updating a Odeme" do
    visit odemes_url
    click_on "Edit", match: :first

    fill_in "Dagitici", with: @odeme.dagitici
    fill_in "Date", with: @odeme.date
    fill_in "Odeme Miktari", with: @odeme.odeme_miktari
    fill_in "Teslim Yeri", with: @odeme.teslim_yeri
    click_on "Update Odeme"

    assert_text "Odeme was successfully updated"
    click_on "Back"
  end

  test "destroying a Odeme" do
    visit odemes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Odeme was successfully destroyed"
  end
end

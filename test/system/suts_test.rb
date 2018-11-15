require "application_system_test_case"

class SutsTest < ApplicationSystemTestCase
  setup do
    @sut = suts(:one)
  end

  test "visiting the index" do
    visit suts_url
    assert_selector "h1", text: "Suts"
  end

  test "creating a Sut" do
    visit suts_url
    click_on "New Sut"

    fill_in "Miktar", with: @sut.miktar
    click_on "Create Sut"

    assert_text "Sut was successfully created"
    click_on "Back"
  end

  test "updating a Sut" do
    visit suts_url
    click_on "Edit", match: :first

    fill_in "Miktar", with: @sut.miktar
    click_on "Update Sut"

    assert_text "Sut was successfully updated"
    click_on "Back"
  end

  test "destroying a Sut" do
    visit suts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sut was successfully destroyed"
  end
end

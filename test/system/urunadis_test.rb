require "application_system_test_case"

class UrunadisTest < ApplicationSystemTestCase
  setup do
    @urunadi = urunadis(:one)
  end

  test "visiting the index" do
    visit urunadis_url
    assert_selector "h1", text: "Urunadis"
  end

  test "creating a Urunadi" do
    visit urunadis_url
    click_on "New Urunadi"

    fill_in "Adi", with: @urunadi.adi
    click_on "Create Urunadi"

    assert_text "Urunadi was successfully created"
    click_on "Back"
  end

  test "updating a Urunadi" do
    visit urunadis_url
    click_on "Edit", match: :first

    fill_in "Adi", with: @urunadi.adi
    click_on "Update Urunadi"

    assert_text "Urunadi was successfully updated"
    click_on "Back"
  end

  test "destroying a Urunadi" do
    visit urunadis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urunadi was successfully destroyed"
  end
end

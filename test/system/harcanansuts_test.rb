require "application_system_test_case"

class HarcanansutsTest < ApplicationSystemTestCase
  setup do
    @harcanansut = harcanansuts(:one)
  end

  test "visiting the index" do
    visit harcanansuts_url
    assert_selector "h1", text: "Harcanansuts"
  end

  test "creating a Harcanansut" do
    visit harcanansuts_url
    click_on "New Harcanansut"

    fill_in "Date", with: @harcanansut.date
    fill_in "Harcanan", with: @harcanansut.harcanan
    click_on "Create Harcanansut"

    assert_text "Harcanansut was successfully created"
    click_on "Back"
  end

  test "updating a Harcanansut" do
    visit harcanansuts_url
    click_on "Edit", match: :first

    fill_in "Date", with: @harcanansut.date
    fill_in "Harcanan", with: @harcanansut.harcanan
    click_on "Update Harcanansut"

    assert_text "Harcanansut was successfully updated"
    click_on "Back"
  end

  test "destroying a Harcanansut" do
    visit harcanansuts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Harcanansut was successfully destroyed"
  end
end

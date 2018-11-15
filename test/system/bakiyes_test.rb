require "application_system_test_case"

class BakiyesTest < ApplicationSystemTestCase
  setup do
    @bakiye = bakiyes(:one)
  end

  test "visiting the index" do
    visit bakiyes_url
    assert_selector "h1", text: "Bakiyes"
  end

  test "creating a Bakiye" do
    visit bakiyes_url
    click_on "New Bakiye"

    fill_in "Date", with: @bakiye.date
    fill_in "Teslim Yeri", with: @bakiye.teslim_yeri
    fill_in "Toplam Borc", with: @bakiye.toplam_borc
    click_on "Create Bakiye"

    assert_text "Bakiye was successfully created"
    click_on "Back"
  end

  test "updating a Bakiye" do
    visit bakiyes_url
    click_on "Edit", match: :first

    fill_in "Date", with: @bakiye.date
    fill_in "Teslim Yeri", with: @bakiye.teslim_yeri
    fill_in "Toplam Borc", with: @bakiye.toplam_borc
    click_on "Update Bakiye"

    assert_text "Bakiye was successfully updated"
    click_on "Back"
  end

  test "destroying a Bakiye" do
    visit bakiyes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bakiye was successfully destroyed"
  end
end

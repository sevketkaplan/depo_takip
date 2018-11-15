require "application_system_test_case"

class UrunsTest < ApplicationSystemTestCase
  setup do
    @urun = uruns(:one)
  end

  test "visiting the index" do
    visit uruns_url
    assert_selector "h1", text: "Uruns"
  end

  test "creating a Urun" do
    visit uruns_url
    click_on "New Urun"

    fill_in "Adi", with: @urun.adi
    fill_in "Date", with: @urun.date
    fill_in "Paket Tipi", with: @urun.paket_tipi
    fill_in "Stok", with: @urun.stok
    click_on "Create Urun"

    assert_text "Urun was successfully created"
    click_on "Back"
  end

  test "updating a Urun" do
    visit uruns_url
    click_on "Edit", match: :first

    fill_in "Adi", with: @urun.adi
    fill_in "Date", with: @urun.date
    fill_in "Paket Tipi", with: @urun.paket_tipi
    fill_in "Stok", with: @urun.stok
    click_on "Update Urun"

    assert_text "Urun was successfully updated"
    click_on "Back"
  end

  test "destroying a Urun" do
    visit uruns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urun was successfully destroyed"
  end
end

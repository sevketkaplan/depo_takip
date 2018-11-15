require "application_system_test_case"

class SatilansTest < ApplicationSystemTestCase
  setup do
    @satilan = satilans(:one)
  end

  test "visiting the index" do
    visit satilans_url
    assert_selector "h1", text: "Satilans"
  end

  test "creating a Satilan" do
    visit satilans_url
    click_on "New Satilan"

    fill_in "Adet", with: @satilan.adet
    fill_in "Adi", with: @satilan.adi
    fill_in "Birim Fiyat", with: @satilan.birim_fiyat
    fill_in "Date", with: @satilan.date
    fill_in "Paket Tipi", with: @satilan.paket_tipi
    fill_in "Teslim Yeri", with: @satilan.teslim_yeri
    fill_in "Toplam Fiyat", with: @satilan.toplam_fiyat
    fill_in "User", with: @satilan.user_id
    click_on "Create Satilan"

    assert_text "Satilan was successfully created"
    click_on "Back"
  end

  test "updating a Satilan" do
    visit satilans_url
    click_on "Edit", match: :first

    fill_in "Adet", with: @satilan.adet
    fill_in "Adi", with: @satilan.adi
    fill_in "Birim Fiyat", with: @satilan.birim_fiyat
    fill_in "Date", with: @satilan.date
    fill_in "Paket Tipi", with: @satilan.paket_tipi
    fill_in "Teslim Yeri", with: @satilan.teslim_yeri
    fill_in "Toplam Fiyat", with: @satilan.toplam_fiyat
    fill_in "User", with: @satilan.user_id
    click_on "Update Satilan"

    assert_text "Satilan was successfully updated"
    click_on "Back"
  end

  test "destroying a Satilan" do
    visit satilans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Satilan was successfully destroyed"
  end
end

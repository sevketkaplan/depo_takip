require "application_system_test_case"

class IadesTest < ApplicationSystemTestCase
  setup do
    @iade = iades(:one)
  end

  test "visiting the index" do
    visit iades_url
    assert_selector "h1", text: "Iades"
  end

  test "creating a Iade" do
    visit iades_url
    click_on "New Iade"

    fill_in "Adet", with: @iade.adet
    fill_in "Adi", with: @iade.adi
    fill_in "Birim Fiyat", with: @iade.birim_fiyat
    fill_in "Dagitici", with: @iade.dagitici
    fill_in "Date", with: @iade.date
    fill_in "Paket Tipi", with: @iade.paket_tipi
    fill_in "Teslim Yeri", with: @iade.teslim_yeri
    fill_in "Toplam Fiyat", with: @iade.toplam_fiyat
    click_on "Create Iade"

    assert_text "Iade was successfully created"
    click_on "Back"
  end

  test "updating a Iade" do
    visit iades_url
    click_on "Edit", match: :first

    fill_in "Adet", with: @iade.adet
    fill_in "Adi", with: @iade.adi
    fill_in "Birim Fiyat", with: @iade.birim_fiyat
    fill_in "Dagitici", with: @iade.dagitici
    fill_in "Date", with: @iade.date
    fill_in "Paket Tipi", with: @iade.paket_tipi
    fill_in "Teslim Yeri", with: @iade.teslim_yeri
    fill_in "Toplam Fiyat", with: @iade.toplam_fiyat
    click_on "Update Iade"

    assert_text "Iade was successfully updated"
    click_on "Back"
  end

  test "destroying a Iade" do
    visit iades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Iade was successfully destroyed"
  end
end

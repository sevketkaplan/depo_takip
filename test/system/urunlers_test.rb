require "application_system_test_case"

class UrunlersTest < ApplicationSystemTestCase
  setup do
    @urunler = urunlers(:one)
  end

  test "visiting the index" do
    visit urunlers_url
    assert_selector "h1", text: "Urunlers"
  end

  test "creating a Urunler" do
    visit urunlers_url
    click_on "New Urunler"

    fill_in "Adi", with: @urunler.adi
    fill_in "Paket Tipi", with: @urunler.paket_tipi
    fill_in "Stok", with: @urunler.stok
    click_on "Create Urunler"

    assert_text "Urunler was successfully created"
    click_on "Back"
  end

  test "updating a Urunler" do
    visit urunlers_url
    click_on "Edit", match: :first

    fill_in "Adi", with: @urunler.adi
    fill_in "Paket Tipi", with: @urunler.paket_tipi
    fill_in "Stok", with: @urunler.stok
    click_on "Update Urunler"

    assert_text "Urunler was successfully updated"
    click_on "Back"
  end

  test "destroying a Urunler" do
    visit urunlers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urunler was successfully destroyed"
  end
end

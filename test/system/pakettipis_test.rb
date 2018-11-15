require "application_system_test_case"

class PakettipisTest < ApplicationSystemTestCase
  setup do
    @pakettipi = pakettipis(:one)
  end

  test "visiting the index" do
    visit pakettipis_url
    assert_selector "h1", text: "Pakettipis"
  end

  test "creating a Pakettipi" do
    visit pakettipis_url
    click_on "New Pakettipi"

    fill_in "Paket Tipi", with: @pakettipi.paket_tipi
    fill_in "Urunadi", with: @pakettipi.urunadi_id
    click_on "Create Pakettipi"

    assert_text "Pakettipi was successfully created"
    click_on "Back"
  end

  test "updating a Pakettipi" do
    visit pakettipis_url
    click_on "Edit", match: :first

    fill_in "Paket Tipi", with: @pakettipi.paket_tipi
    fill_in "Urunadi", with: @pakettipi.urunadi_id
    click_on "Update Pakettipi"

    assert_text "Pakettipi was successfully updated"
    click_on "Back"
  end

  test "destroying a Pakettipi" do
    visit pakettipis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pakettipi was successfully destroyed"
  end
end

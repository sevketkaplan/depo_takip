require "application_system_test_case"

class FirmagiderisTest < ApplicationSystemTestCase
  setup do
    @firmagideri = firmagideris(:one)
  end

  test "visiting the index" do
    visit firmagideris_url
    assert_selector "h1", text: "Firmagideris"
  end

  test "creating a Firmagideri" do
    visit firmagideris_url
    click_on "New Firmagideri"

    fill_in "Dogalgaz", with: @firmagideri.dogalgaz
    fill_in "Elektrik", with: @firmagideri.elektrik
    fill_in "Kira", with: @firmagideri.kira
    fill_in "Su", with: @firmagideri.su
    fill_in "Vergi", with: @firmagideri.vergi
    fill_in "Yemek", with: @firmagideri.yemek
    click_on "Create Firmagideri"

    assert_text "Firmagideri was successfully created"
    click_on "Back"
  end

  test "updating a Firmagideri" do
    visit firmagideris_url
    click_on "Edit", match: :first

    fill_in "Dogalgaz", with: @firmagideri.dogalgaz
    fill_in "Elektrik", with: @firmagideri.elektrik
    fill_in "Kira", with: @firmagideri.kira
    fill_in "Su", with: @firmagideri.su
    fill_in "Vergi", with: @firmagideri.vergi
    fill_in "Yemek", with: @firmagideri.yemek
    click_on "Update Firmagideri"

    assert_text "Firmagideri was successfully updated"
    click_on "Back"
  end

  test "destroying a Firmagideri" do
    visit firmagideris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Firmagideri was successfully destroyed"
  end
end

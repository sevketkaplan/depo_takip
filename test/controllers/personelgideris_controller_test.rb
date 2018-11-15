require 'test_helper'

class PersonelgiderisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personelgideri = personelgideris(:one)
  end

  test "should get index" do
    get personelgideris_url
    assert_response :success
  end

  test "should get new" do
    get new_personelgideri_url
    assert_response :success
  end

  test "should create personelgideri" do
    assert_difference('Personelgideri.count') do
      post personelgideris_url, params: { personelgideri: { maas: @personelgideri.maas, sigorta: @personelgideri.sigorta } }
    end

    assert_redirected_to personelgideri_url(Personelgideri.last)
  end

  test "should show personelgideri" do
    get personelgideri_url(@personelgideri)
    assert_response :success
  end

  test "should get edit" do
    get edit_personelgideri_url(@personelgideri)
    assert_response :success
  end

  test "should update personelgideri" do
    patch personelgideri_url(@personelgideri), params: { personelgideri: { maas: @personelgideri.maas, sigorta: @personelgideri.sigorta } }
    assert_redirected_to personelgideri_url(@personelgideri)
  end

  test "should destroy personelgideri" do
    assert_difference('Personelgideri.count', -1) do
      delete personelgideri_url(@personelgideri)
    end

    assert_redirected_to personelgideris_url
  end
end

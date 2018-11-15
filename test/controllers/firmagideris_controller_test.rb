require 'test_helper'

class FirmagiderisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @firmagideri = firmagideris(:one)
  end

  test "should get index" do
    get firmagideris_url
    assert_response :success
  end

  test "should get new" do
    get new_firmagideri_url
    assert_response :success
  end

  test "should create firmagideri" do
    assert_difference('Firmagideri.count') do
      post firmagideris_url, params: { firmagideri: { dogalgaz: @firmagideri.dogalgaz, elektrik: @firmagideri.elektrik, kira: @firmagideri.kira, su: @firmagideri.su, vergi: @firmagideri.vergi, yemek: @firmagideri.yemek } }
    end

    assert_redirected_to firmagideri_url(Firmagideri.last)
  end

  test "should show firmagideri" do
    get firmagideri_url(@firmagideri)
    assert_response :success
  end

  test "should get edit" do
    get edit_firmagideri_url(@firmagideri)
    assert_response :success
  end

  test "should update firmagideri" do
    patch firmagideri_url(@firmagideri), params: { firmagideri: { dogalgaz: @firmagideri.dogalgaz, elektrik: @firmagideri.elektrik, kira: @firmagideri.kira, su: @firmagideri.su, vergi: @firmagideri.vergi, yemek: @firmagideri.yemek } }
    assert_redirected_to firmagideri_url(@firmagideri)
  end

  test "should destroy firmagideri" do
    assert_difference('Firmagideri.count', -1) do
      delete firmagideri_url(@firmagideri)
    end

    assert_redirected_to firmagideris_url
  end
end

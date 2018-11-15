require 'test_helper'

class SatilansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @satilan = satilans(:one)
  end

  test "should get index" do
    get satilans_url
    assert_response :success
  end

  test "should get new" do
    get new_satilan_url
    assert_response :success
  end

  test "should create satilan" do
    assert_difference('Satilan.count') do
      post satilans_url, params: { satilan: { adet: @satilan.adet, adi: @satilan.adi, birim_fiyat: @satilan.birim_fiyat, date: @satilan.date, paket_tipi: @satilan.paket_tipi, teslim_yeri: @satilan.teslim_yeri, toplam_fiyat: @satilan.toplam_fiyat, user_id: @satilan.user_id } }
    end

    assert_redirected_to satilan_url(Satilan.last)
  end

  test "should show satilan" do
    get satilan_url(@satilan)
    assert_response :success
  end

  test "should get edit" do
    get edit_satilan_url(@satilan)
    assert_response :success
  end

  test "should update satilan" do
    patch satilan_url(@satilan), params: { satilan: { adet: @satilan.adet, adi: @satilan.adi, birim_fiyat: @satilan.birim_fiyat, date: @satilan.date, paket_tipi: @satilan.paket_tipi, teslim_yeri: @satilan.teslim_yeri, toplam_fiyat: @satilan.toplam_fiyat, user_id: @satilan.user_id } }
    assert_redirected_to satilan_url(@satilan)
  end

  test "should destroy satilan" do
    assert_difference('Satilan.count', -1) do
      delete satilan_url(@satilan)
    end

    assert_redirected_to satilans_url
  end
end

require 'test_helper'

class IadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iade = iades(:one)
  end

  test "should get index" do
    get iades_url
    assert_response :success
  end

  test "should get new" do
    get new_iade_url
    assert_response :success
  end

  test "should create iade" do
    assert_difference('Iade.count') do
      post iades_url, params: { iade: { adet: @iade.adet, adi: @iade.adi, birim_fiyat: @iade.birim_fiyat, dagitici: @iade.dagitici, date: @iade.date, paket_tipi: @iade.paket_tipi, teslim_yeri: @iade.teslim_yeri, toplam_fiyat: @iade.toplam_fiyat } }
    end

    assert_redirected_to iade_url(Iade.last)
  end

  test "should show iade" do
    get iade_url(@iade)
    assert_response :success
  end

  test "should get edit" do
    get edit_iade_url(@iade)
    assert_response :success
  end

  test "should update iade" do
    patch iade_url(@iade), params: { iade: { adet: @iade.adet, adi: @iade.adi, birim_fiyat: @iade.birim_fiyat, dagitici: @iade.dagitici, date: @iade.date, paket_tipi: @iade.paket_tipi, teslim_yeri: @iade.teslim_yeri, toplam_fiyat: @iade.toplam_fiyat } }
    assert_redirected_to iade_url(@iade)
  end

  test "should destroy iade" do
    assert_difference('Iade.count', -1) do
      delete iade_url(@iade)
    end

    assert_redirected_to iades_url
  end
end

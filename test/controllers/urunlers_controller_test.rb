require 'test_helper'

class UrunlersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urunler = urunlers(:one)
  end

  test "should get index" do
    get urunlers_url
    assert_response :success
  end

  test "should get new" do
    get new_urunler_url
    assert_response :success
  end

  test "should create urunler" do
    assert_difference('Urunler.count') do
      post urunlers_url, params: { urunler: { adi: @urunler.adi, paket_tipi: @urunler.paket_tipi, stok: @urunler.stok } }
    end

    assert_redirected_to urunler_url(Urunler.last)
  end

  test "should show urunler" do
    get urunler_url(@urunler)
    assert_response :success
  end

  test "should get edit" do
    get edit_urunler_url(@urunler)
    assert_response :success
  end

  test "should update urunler" do
    patch urunler_url(@urunler), params: { urunler: { adi: @urunler.adi, paket_tipi: @urunler.paket_tipi, stok: @urunler.stok } }
    assert_redirected_to urunler_url(@urunler)
  end

  test "should destroy urunler" do
    assert_difference('Urunler.count', -1) do
      delete urunler_url(@urunler)
    end

    assert_redirected_to urunlers_url
  end
end

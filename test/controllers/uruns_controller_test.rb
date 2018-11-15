require 'test_helper'

class UrunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urun = uruns(:one)
  end

  test "should get index" do
    get uruns_url
    assert_response :success
  end

  test "should get new" do
    get new_urun_url
    assert_response :success
  end

  test "should create urun" do
    assert_difference('Urun.count') do
      post uruns_url, params: { urun: { adi: @urun.adi, date: @urun.date, paket_tipi: @urun.paket_tipi, stok: @urun.stok } }
    end

    assert_redirected_to urun_url(Urun.last)
  end

  test "should show urun" do
    get urun_url(@urun)
    assert_response :success
  end

  test "should get edit" do
    get edit_urun_url(@urun)
    assert_response :success
  end

  test "should update urun" do
    patch urun_url(@urun), params: { urun: { adi: @urun.adi, date: @urun.date, paket_tipi: @urun.paket_tipi, stok: @urun.stok } }
    assert_redirected_to urun_url(@urun)
  end

  test "should destroy urun" do
    assert_difference('Urun.count', -1) do
      delete urun_url(@urun)
    end

    assert_redirected_to uruns_url
  end
end

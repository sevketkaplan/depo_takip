require 'test_helper'

class PakettipisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pakettipi = pakettipis(:one)
  end

  test "should get index" do
    get pakettipis_url
    assert_response :success
  end

  test "should get new" do
    get new_pakettipi_url
    assert_response :success
  end

  test "should create pakettipi" do
    assert_difference('Pakettipi.count') do
      post pakettipis_url, params: { pakettipi: { paket_tipi: @pakettipi.paket_tipi, urunadi_id: @pakettipi.urunadi_id } }
    end

    assert_redirected_to pakettipi_url(Pakettipi.last)
  end

  test "should show pakettipi" do
    get pakettipi_url(@pakettipi)
    assert_response :success
  end

  test "should get edit" do
    get edit_pakettipi_url(@pakettipi)
    assert_response :success
  end

  test "should update pakettipi" do
    patch pakettipi_url(@pakettipi), params: { pakettipi: { paket_tipi: @pakettipi.paket_tipi, urunadi_id: @pakettipi.urunadi_id } }
    assert_redirected_to pakettipi_url(@pakettipi)
  end

  test "should destroy pakettipi" do
    assert_difference('Pakettipi.count', -1) do
      delete pakettipi_url(@pakettipi)
    end

    assert_redirected_to pakettipis_url
  end
end

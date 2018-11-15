require 'test_helper'

class UrunadisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urunadi = urunadis(:one)
  end

  test "should get index" do
    get urunadis_url
    assert_response :success
  end

  test "should get new" do
    get new_urunadi_url
    assert_response :success
  end

  test "should create urunadi" do
    assert_difference('Urunadi.count') do
      post urunadis_url, params: { urunadi: { adi: @urunadi.adi } }
    end

    assert_redirected_to urunadi_url(Urunadi.last)
  end

  test "should show urunadi" do
    get urunadi_url(@urunadi)
    assert_response :success
  end

  test "should get edit" do
    get edit_urunadi_url(@urunadi)
    assert_response :success
  end

  test "should update urunadi" do
    patch urunadi_url(@urunadi), params: { urunadi: { adi: @urunadi.adi } }
    assert_redirected_to urunadi_url(@urunadi)
  end

  test "should destroy urunadi" do
    assert_difference('Urunadi.count', -1) do
      delete urunadi_url(@urunadi)
    end

    assert_redirected_to urunadis_url
  end
end

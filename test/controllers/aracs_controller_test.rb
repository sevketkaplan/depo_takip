require 'test_helper'

class AracsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arac = aracs(:one)
  end

  test "should get index" do
    get aracs_url
    assert_response :success
  end

  test "should get new" do
    get new_arac_url
    assert_response :success
  end

  test "should create arac" do
    assert_difference('Arac.count') do
      post aracs_url, params: { arac: { plaka: @arac.plaka } }
    end

    assert_redirected_to arac_url(Arac.last)
  end

  test "should show arac" do
    get arac_url(@arac)
    assert_response :success
  end

  test "should get edit" do
    get edit_arac_url(@arac)
    assert_response :success
  end

  test "should update arac" do
    patch arac_url(@arac), params: { arac: { plaka: @arac.plaka } }
    assert_redirected_to arac_url(@arac)
  end

  test "should destroy arac" do
    assert_difference('Arac.count', -1) do
      delete arac_url(@arac)
    end

    assert_redirected_to aracs_url
  end
end

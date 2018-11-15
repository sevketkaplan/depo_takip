require 'test_helper'

class SutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sut = suts(:one)
  end

  test "should get index" do
    get suts_url
    assert_response :success
  end

  test "should get new" do
    get new_sut_url
    assert_response :success
  end

  test "should create sut" do
    assert_difference('Sut.count') do
      post suts_url, params: { sut: { miktar: @sut.miktar } }
    end

    assert_redirected_to sut_url(Sut.last)
  end

  test "should show sut" do
    get sut_url(@sut)
    assert_response :success
  end

  test "should get edit" do
    get edit_sut_url(@sut)
    assert_response :success
  end

  test "should update sut" do
    patch sut_url(@sut), params: { sut: { miktar: @sut.miktar } }
    assert_redirected_to sut_url(@sut)
  end

  test "should destroy sut" do
    assert_difference('Sut.count', -1) do
      delete sut_url(@sut)
    end

    assert_redirected_to suts_url
  end
end

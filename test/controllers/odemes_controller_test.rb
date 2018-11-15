require 'test_helper'

class OdemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @odeme = odemes(:one)
  end

  test "should get index" do
    get odemes_url
    assert_response :success
  end

  test "should get new" do
    get new_odeme_url
    assert_response :success
  end

  test "should create odeme" do
    assert_difference('Odeme.count') do
      post odemes_url, params: { odeme: { dagitici: @odeme.dagitici, date: @odeme.date, odeme_miktari: @odeme.odeme_miktari, teslim_yeri: @odeme.teslim_yeri } }
    end

    assert_redirected_to odeme_url(Odeme.last)
  end

  test "should show odeme" do
    get odeme_url(@odeme)
    assert_response :success
  end

  test "should get edit" do
    get edit_odeme_url(@odeme)
    assert_response :success
  end

  test "should update odeme" do
    patch odeme_url(@odeme), params: { odeme: { dagitici: @odeme.dagitici, date: @odeme.date, odeme_miktari: @odeme.odeme_miktari, teslim_yeri: @odeme.teslim_yeri } }
    assert_redirected_to odeme_url(@odeme)
  end

  test "should destroy odeme" do
    assert_difference('Odeme.count', -1) do
      delete odeme_url(@odeme)
    end

    assert_redirected_to odemes_url
  end
end

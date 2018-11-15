require 'test_helper'

class BakiyesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bakiye = bakiyes(:one)
  end

  test "should get index" do
    get bakiyes_url
    assert_response :success
  end

  test "should get new" do
    get new_bakiye_url
    assert_response :success
  end

  test "should create bakiye" do
    assert_difference('Bakiye.count') do
      post bakiyes_url, params: { bakiye: { date: @bakiye.date, teslim_yeri: @bakiye.teslim_yeri, toplam_borc: @bakiye.toplam_borc } }
    end

    assert_redirected_to bakiye_url(Bakiye.last)
  end

  test "should show bakiye" do
    get bakiye_url(@bakiye)
    assert_response :success
  end

  test "should get edit" do
    get edit_bakiye_url(@bakiye)
    assert_response :success
  end

  test "should update bakiye" do
    patch bakiye_url(@bakiye), params: { bakiye: { date: @bakiye.date, teslim_yeri: @bakiye.teslim_yeri, toplam_borc: @bakiye.toplam_borc } }
    assert_redirected_to bakiye_url(@bakiye)
  end

  test "should destroy bakiye" do
    assert_difference('Bakiye.count', -1) do
      delete bakiye_url(@bakiye)
    end

    assert_redirected_to bakiyes_url
  end
end

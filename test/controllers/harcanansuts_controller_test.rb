require 'test_helper'

class HarcanansutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @harcanansut = harcanansuts(:one)
  end

  test "should get index" do
    get harcanansuts_url
    assert_response :success
  end

  test "should get new" do
    get new_harcanansut_url
    assert_response :success
  end

  test "should create harcanansut" do
    assert_difference('Harcanansut.count') do
      post harcanansuts_url, params: { harcanansut: { date: @harcanansut.date, harcanan: @harcanansut.harcanan } }
    end

    assert_redirected_to harcanansut_url(Harcanansut.last)
  end

  test "should show harcanansut" do
    get harcanansut_url(@harcanansut)
    assert_response :success
  end

  test "should get edit" do
    get edit_harcanansut_url(@harcanansut)
    assert_response :success
  end

  test "should update harcanansut" do
    patch harcanansut_url(@harcanansut), params: { harcanansut: { date: @harcanansut.date, harcanan: @harcanansut.harcanan } }
    assert_redirected_to harcanansut_url(@harcanansut)
  end

  test "should destroy harcanansut" do
    assert_difference('Harcanansut.count', -1) do
      delete harcanansut_url(@harcanansut)
    end

    assert_redirected_to harcanansuts_url
  end
end

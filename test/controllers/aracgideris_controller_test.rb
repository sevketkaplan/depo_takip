require 'test_helper'

class AracgiderisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aracgideri = aracgideris(:one)
  end

  test "should get index" do
    get aracgideris_url
    assert_response :success
  end

  test "should get new" do
    get new_aracgideri_url
    assert_response :success
  end

  test "should create aracgideri" do
    assert_difference('Aracgideri.count') do
      post aracgideris_url, params: { aracgideri: { bakim: @aracgideri.bakim, kasko: @aracgideri.kasko, mtv: @aracgideri.mtv, plaka: @aracgideri.plaka, sigorta: @aracgideri.sigorta, yakit: @aracgideri.yakit } }
    end

    assert_redirected_to aracgideri_url(Aracgideri.last)
  end

  test "should show aracgideri" do
    get aracgideri_url(@aracgideri)
    assert_response :success
  end

  test "should get edit" do
    get edit_aracgideri_url(@aracgideri)
    assert_response :success
  end

  test "should update aracgideri" do
    patch aracgideri_url(@aracgideri), params: { aracgideri: { bakim: @aracgideri.bakim, kasko: @aracgideri.kasko, mtv: @aracgideri.mtv, plaka: @aracgideri.plaka, sigorta: @aracgideri.sigorta, yakit: @aracgideri.yakit } }
    assert_redirected_to aracgideri_url(@aracgideri)
  end

  test "should destroy aracgideri" do
    assert_difference('Aracgideri.count', -1) do
      delete aracgideri_url(@aracgideri)
    end

    assert_redirected_to aracgideris_url
  end
end

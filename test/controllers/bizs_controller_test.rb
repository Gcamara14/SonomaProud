require 'test_helper'

class BizsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biz = bizs(:one)
  end

  test "should get index" do
    get bizs_url
    assert_response :success
  end

  test "should get new" do
    get new_biz_url
    assert_response :success
  end

  test "should create biz" do
    assert_difference('Biz.count') do
      post bizs_url, params: { biz: { description: @biz.description, facebook: @biz.facebook, google: @biz.google, location: @biz.location, name: @biz.name, phone: @biz.phone, twitter: @biz.twitter, website: @biz.website, yelp: @biz.yelp } }
    end

    assert_redirected_to biz_url(Biz.last)
  end

  test "should show biz" do
    get biz_url(@biz)
    assert_response :success
  end

  test "should get edit" do
    get edit_biz_url(@biz)
    assert_response :success
  end

  test "should update biz" do
    patch biz_url(@biz), params: { biz: { description: @biz.description, facebook: @biz.facebook, google: @biz.google, location: @biz.location, name: @biz.name, phone: @biz.phone, twitter: @biz.twitter, website: @biz.website, yelp: @biz.yelp } }
    assert_redirected_to biz_url(@biz)
  end

  test "should destroy biz" do
    assert_difference('Biz.count', -1) do
      delete biz_url(@biz)
    end

    assert_redirected_to bizs_url
  end
end

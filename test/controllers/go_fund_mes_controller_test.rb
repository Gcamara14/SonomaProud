require 'test_helper'

class GoFundMesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @go_fund_me = go_fund_mes(:one)
  end

  test "should get index" do
    get go_fund_mes_url
    assert_response :success
  end

  test "should get new" do
    get new_go_fund_me_url
    assert_response :success
  end

  test "should create go_fund_me" do
    assert_difference('GoFundMe.count') do
      post go_fund_mes_url, params: { go_fund_me: { beneficiary: @go_fund_me.beneficiary, campaign: @go_fund_me.campaign, embed: @go_fund_me.embed, user_id: @go_fund_me.user_id } }
    end

    assert_redirected_to go_fund_me_url(GoFundMe.last)
  end

  test "should show go_fund_me" do
    get go_fund_me_url(@go_fund_me)
    assert_response :success
  end

  test "should get edit" do
    get edit_go_fund_me_url(@go_fund_me)
    assert_response :success
  end

  test "should update go_fund_me" do
    patch go_fund_me_url(@go_fund_me), params: { go_fund_me: { beneficiary: @go_fund_me.beneficiary, campaign: @go_fund_me.campaign, embed: @go_fund_me.embed, user_id: @go_fund_me.user_id } }
    assert_redirected_to go_fund_me_url(@go_fund_me)
  end

  test "should destroy go_fund_me" do
    assert_difference('GoFundMe.count', -1) do
      delete go_fund_me_url(@go_fund_me)
    end

    assert_redirected_to go_fund_mes_url
  end
end

require "test_helper"

class InsuranceProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance_provider = insurance_providers(:one)
  end

  test "should get index" do
    get insurance_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_insurance_provider_url
    assert_response :success
  end

  test "should create insurance_provider" do
    assert_difference("InsuranceProvider.count") do
      post insurance_providers_url, params: { insurance_provider: { name: @insurance_provider.name } }
    end

    assert_redirected_to insurance_provider_url(InsuranceProvider.last)
  end

  test "should show insurance_provider" do
    get insurance_provider_url(@insurance_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_insurance_provider_url(@insurance_provider)
    assert_response :success
  end

  test "should update insurance_provider" do
    patch insurance_provider_url(@insurance_provider), params: { insurance_provider: { name: @insurance_provider.name } }
    assert_redirected_to insurance_provider_url(@insurance_provider)
  end

  test "should destroy insurance_provider" do
    assert_difference("InsuranceProvider.count", -1) do
      delete insurance_provider_url(@insurance_provider)
    end

    assert_redirected_to insurance_providers_url
  end
end

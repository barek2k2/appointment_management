require "test_helper"

class BillingMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing_method = billing_methods(:one)
  end

  test "should get index" do
    get billing_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_method_url
    assert_response :success
  end

  test "should create billing_method" do
    assert_difference("BillingMethod.count") do
      post billing_methods_url, params: { billing_method: { name: @billing_method.name } }
    end

    assert_redirected_to billing_method_url(BillingMethod.last)
  end

  test "should show billing_method" do
    get billing_method_url(@billing_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_method_url(@billing_method)
    assert_response :success
  end

  test "should update billing_method" do
    patch billing_method_url(@billing_method), params: { billing_method: { name: @billing_method.name } }
    assert_redirected_to billing_method_url(@billing_method)
  end

  test "should destroy billing_method" do
    assert_difference("BillingMethod.count", -1) do
      delete billing_method_url(@billing_method)
    end

    assert_redirected_to billing_methods_url
  end
end

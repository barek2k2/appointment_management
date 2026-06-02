require "application_system_test_case"

class InsuranceProvidersTest < ApplicationSystemTestCase
  setup do
    @insurance_provider = insurance_providers(:one)
  end

  test "visiting the index" do
    visit insurance_providers_url
    assert_selector "h1", text: "Insurance providers"
  end

  test "should create insurance provider" do
    visit insurance_providers_url
    click_on "New insurance provider"

    fill_in "Name", with: @insurance_provider.name
    click_on "Create Insurance provider"

    assert_text "Insurance provider was successfully created"
    click_on "Back"
  end

  test "should update Insurance provider" do
    visit insurance_provider_url(@insurance_provider)
    click_on "Edit this insurance provider", match: :first

    fill_in "Name", with: @insurance_provider.name
    click_on "Update Insurance provider"

    assert_text "Insurance provider was successfully updated"
    click_on "Back"
  end

  test "should destroy Insurance provider" do
    visit insurance_provider_url(@insurance_provider)
    click_on "Destroy this insurance provider", match: :first

    assert_text "Insurance provider was successfully destroyed"
  end
end

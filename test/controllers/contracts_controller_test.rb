require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contracts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get contracts_destroy_url
    assert_response :success
  end

end

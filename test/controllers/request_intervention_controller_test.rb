require 'test_helper'

class RequestInterventionControllerTest < ActionDispatch::IntegrationTest
  test "should get intervention_form" do
    get request_intervention_intervention_form_url
    assert_response :success
  end

end

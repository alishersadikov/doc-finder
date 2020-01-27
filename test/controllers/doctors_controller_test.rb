require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test 'root leads to landing page' do
    get root_path

    assert_match "Doctor Finder", @response.body
    assert_match "Search by name", @response.body
  end
end

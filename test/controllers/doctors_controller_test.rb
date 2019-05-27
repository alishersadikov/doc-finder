require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get doctors_path

    assert_match "Doctor Finder", @response.body
    assert_match "Search by name", @response.body
  end
end

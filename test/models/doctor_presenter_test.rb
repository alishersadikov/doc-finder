class DoctorPresenterTest < ActiveSupport::TestCase
  def sample_response
    read_file('sample_search_response.json')
  end

  def sample_doctor_data
    JSON.parse(sample_response, symbolize_names: true)[:data].first
  end

  def sample_doctor
    DoctorPresenter.new(data: sample_doctor_data)
  end

  test 'name' do
    assert_equal "John John Yu", sample_doctor.name
  end

  test 'title' do
    assert_equal "DDS", sample_doctor.title
  end

  test 'specialties' do
    assert_equal ["endotontist"], sample_doctor.specialties
  end

  test 'insurances' do
    assert_equal ["Assurant DHA", "Assurant DHA Premier"], sample_doctor.insurances
  end

  test 'primary_care_physician' do
    assert_not sample_doctor.primary_care_physician
  end
end

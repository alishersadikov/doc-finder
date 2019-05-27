class DoctorSearchServiceTest < ActiveSupport::TestCase
  def sample_response
    read_file('sample_search_response.json')
  end

  def sample_doctor_data
    JSON.parse(sample_response, symbolize_names: true)[:data].first
  end

  def sample_doctor
    Doctor.new(data: sample_doctor_data)
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

  test 'can be easily converted to JSON' do
    expected = {
      name: sample_doctor.name,
      title: sample_doctor.title,
      specialties: sample_doctor.specialties,
      insurances: sample_doctor.insurances,
      primary_care_physician: sample_doctor.primary_care_physician
    }.to_json

    assert_equal expected, sample_doctor.to_json
  end
end

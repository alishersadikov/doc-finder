class DoctorSearchServiceTest < ActiveSupport::TestCase
  def setup
    stub_request(:get, "#{ENV['API_BASE_URL']}?name=John&user_key=#{ENV['API_KEY']}").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.15.0'}).
      to_return(status: 200, body: sample_response, headers: {})
  end

  def sample_response
    read_file('sample_search_response.json')
  end

  test 'valid with arguments' do
    assert DoctorSearchService.new(name: 'John')
  end

  test 'invalid without arguments' do
    assert_raises ArgumentError do
      DoctorSearchService.new
    end
  end

  test 'number of doctors in sample response' do
    docs = DoctorSearchService.new(name: 'John').process
    assert_equal 5, docs.count
  end

  test 'one of the names is indeed John' do
    docs = DoctorSearchService.new(name: 'John').process
    docs.each do |doc|
      assert doc.name.include?('John')
    end
  end
end

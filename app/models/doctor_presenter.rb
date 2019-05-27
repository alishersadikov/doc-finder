class DoctorPresenter
  def initialize(data: )
    @data = data
  end

  def name
    "#{@data[:profile][:first_name]} #{@data[:profile][:middle_name]} #{@data[:profile][:last_name]}"
  end

  def title
    @data[:profile][:title]
  end

  def specialties
    @data[:specialties].map { |specialty|  specialty[:uid] }
  end

  def insurances
    # Spec: Map "insurance_uids" to the labels. While that was confusing,
    # based on the sample JSON response provided, it was concluded that what we
    # are interested in here is the insurance plan name(s). In addition, it
    # seemed like there was no need to retrieve providers and plans as they come
    # ready and scoped to the doctors
    @data[:insurances].map { |insurance|  insurance[:insurance_plan][:name] }
  end

  def primary_care_physician
    (specialties & pcp_eligible_specialties).present?
  end

  private

  def pcp_eligible_specialties
    [
      'family-practitioner',
      'family-medicine-adult-medicine',
      'general-practice',
      'general-practitioner',
      'internist',
      'geriatric-medicine-doctor',
      'internal-medicine-adolescent-medicine',
      'adolescent-medicine-pediatrician',
      'obstetrics-gynecologist',
      'general-practitioner',
      'pediatrician',
      'primary-care-nurse-practitioner',
      'family-nurse-practitioner',
      'nurse-practitioner',
      'adolescent-medicine-pediatrician',
      'family-medicine-geriatric-medicine',
      'physician-assistant',
      'medical-physician-assistant',
      'adult-medicine-physician-assistant'
    ]
  end
end

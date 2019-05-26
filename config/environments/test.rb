Rails.application.configure do
  # To silence the deprecation warning
  config.active_support.test_order = :sorted

  config.eager_load = false
end

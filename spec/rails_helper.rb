if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

require 'spec_helper'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include ShoppingCart::FeaturesHelper, type: :feature
  config.include ShoppingCart::CheckoutFeaturesHelper, type: :feature, checkout: true
  config.filter_rails_from_backtrace!
end

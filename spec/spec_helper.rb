# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.before(:all) do
    self.class.class_eval do
      set_fixture_class :gene_name_report => DataModel::Gene
      set_fixture_class :gene_name_report_association => DataModel::GeneAlternateName
      set_fixture_class :gene_name_report_category_association => DataModel::GeneCategory
      set_fixture_class :gene_name_group => DataModel::GeneGroup
      set_fixture_class :drug_name_report => DataModel::Drug
      set_fixture_class :drug_name_report_association => DataModel::DrugAlternateName
      set_fixture_class :drug_name_report_category_association => DataModel::DrugCategory
      set_fixture_class :drug_gene_interaction_report => DataModel::Interaction
      set_fixture_class :drug_gene_interaction_report_attribute => DataModel::InteractionAttribute
    end
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler/setup'
require 'rails/all'
require 'data_display'
require 'rails/generators/test_case'
require 'generators/data_display/install/install_generator'
require 'factory_girl'

# Database
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)
ActiveRecord::Migration.verbose = false

# Locale
I18n.load_path << "#{File.dirname(__FILE__)}/data_display.en.yml"

# Schema
load "schema.rb"

# Models
load 'models.rb'

# Factories
FactoryGirl.definition_file_paths = ["#{File.dirname(__FILE__)}/factories"]
FactoryGirl.find_definitions
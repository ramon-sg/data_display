require 'active_support'
require 'action_view'
require 'data_display/actions'
require 'data_display/model_additions'

ActiveRecord::Base.send :include, DataDisplay::ModelAdditions if defined? ActiveRecord

# Testing
# Mongoid::Document.send(:include, DataDisplay::ModelAdditions) if defined?(Mongoid) && defined?(Mongoid::Document)
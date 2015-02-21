require 'rails/generators'
module DataDisplay
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_ability
        if locale =~ /es$|es-/i
          template "data_display.es.yml", "config/locales/data_display.#{locale}.yml"
        else
          template "data_display.en.yml", "config/locales/data_display.#{locale}.yml"
        end
      end

      private
        def locale
          I18n.locale
        end
    end
  end
end
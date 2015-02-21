class DataDisplayGeneratorSpec < Rails::Generators::TestCase
  tests DataDisplay::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  teardown { rm_rf(destination_root) }

  test "Assert all files are properly created" do
    %w(es es-CL en es-IN de).each do |locale|
      assert_locale_file locale
    end
  end

  private
    def assert_locale_file(locale, delete = true)
      I18n.stubs(:locale).returns(locale)
      run_generator
      assert_file "config/locales/data_display.#{locale}.yml" do |locale_file|
        assert_match(/#{locale}/, locale_file)
      end
    end
end
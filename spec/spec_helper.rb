require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/mini_test'
require 'dummy/init'

class HelperTest < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior
  register_spec_type(/Helper/, self)
end

module MiniTest
  class Spec
    include FactoryGirl::Syntax::Methods
    class << self
      alias_method :context, :describe
    end
  end
end
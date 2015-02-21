require 'spec_helper'

describe DataDisplay::ModelAdditions do
  let(:user) { create(:user, birthday: Date.new(2001,2,3)) }
  let(:article){ create(:article) }

  describe 'when model have some displayable attributes' do
    it { user.methods.include?(:admin_display).must_equal true }
    it { user.methods.include?(:birthday_display).must_equal true }
    it { user.methods.include?(:created_at_display).must_equal true }

    it { user.methods.exclude?(:password_display).must_equal true }
    it { user.methods.exclude?(:updated_at_display).must_equal true }
    it { user.methods.exclude?(:name_display).must_equal true }
    it { user.methods.exclude?(:id_display).must_equal true }
    it { user.methods.exclude?(:email_display).must_equal true }

    it { user.birthday_display.must_equal 'February 03, 2001' }
    it { user.birthday_display(:short).must_equal 'Feb 03' }
  end

  describe 'when model have all displayable attributes' do
    it { article.methods.include?(:title_display).must_equal true }
    it { article.methods.include?(:content_display).must_equal true }

    it { article.methods.include?(:id_display).must_equal true }
    it { article.methods.include?(:created_at_display).must_equal true }
    it { article.methods.include?(:updated_at_display).must_equal true }
  end
end
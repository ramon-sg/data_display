require 'spec_helper'

describe DataDisplay::Actions do

  let(:klass)   { Class.new{ include DataDisplay::Actions } }
  let(:actions) { klass.new }
  let(:string)  { 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus' }

  describe '#__data_display__' do
    it 'pass unknown object' do
      object = Object.new
      actions.__data_display__(object).must_equal object
    end

    it 'pass a true value' do
      actions.__data_display__(true).must_equal 'Yes'
    end

    it 'pass a false value' do
      actions.__data_display__(false).must_equal 'No'
    end

    describe 'when format is delimiter (default)' do
      it 'pass fixnum value' do
        fixnum = 25000000
        actions.__data_display__(fixnum).must_equal '25,000,000'
      end
    end

    describe 'when format is currency' do
      it 'pass fixnum value' do
        fixnum = 25000000
        actions.__data_display__(fixnum, :currency).must_equal '$25,000,000.00'
      end
    end

    describe 'when format is short' do
      it 'pass a nil value' do
        actions.__data_display__(nil, :short).must_equal '-'
      end

      it 'pass date value' do
        date = Date.new(2001,2,3)
        actions.__data_display__(date, :short).must_equal 'Feb 03'
      end

      it 'pass time value' do
        time = Time.new(2002, 10, 31, 2, 2, 2, "+02:00")
        actions.__data_display__(time, :short).must_equal '31 Oct 02:02'
      end

      it 'pass date_time value' do
        date_time = DateTime.new(2003, 10, 31, 2, 2, 2, "+02:00")
        actions.__data_display__(date_time, :short).must_equal '31 Oct 02:02'
      end

      it 'pass string value' do
        truncate_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit....'
        actions.__data_display__(string, :short).must_equal truncate_string
      end
    end

    describe 'when format is long (default)' do
      it 'pass a nil value' do
        actions.__data_display__(nil).must_equal '(empty)'
      end

      it 'pass date value' do
        date = Date.new(2004,2,3)
        actions.__data_display__(date).must_equal 'February 03, 2004'
      end

      it 'pass time value' do
        time = Time.new(2007, 10, 31, 2, 2, 2, "+02:00")
        actions.__data_display__(time).must_equal 'October 31, 2007 02:02'
      end

      it 'pass date_time value' do
        date_time = DateTime.new(2009, 10, 31, 2, 2, 2, "+02:00")
        actions.__data_display__(date_time).must_equal 'October 31, 2009 02:02'
      end

      it 'pass string value' do
        truncate_string = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ...'
        actions.__data_display__(string).must_equal truncate_string
      end
    end
  end
end
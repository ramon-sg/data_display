module DataDisplay
  module Actions
    class Display
      include ActiveSupport::Inflector
      include ActionView::Helpers::TextHelper
      include ActionView::Helpers::NumberHelper

      attr_reader :raw_value, :format

      def initialize(raw_value, format)
        @raw_value = raw_value
        @format = format && format.to_sym
      end

      def value
        respond_to?(method_name, true) ? send(method_name) : raw_value
      end

      private
        def true_class_display
          translate
        end

        def false_class_display
          translate
        end

        def fixnum_display
          number_display
        end

        def float_display
          number_display
        end

        def number_display
          case fixnum_format
          when :delimiter
            number_with_delimiter raw_value
          when :currency
            number_to_currency raw_value
          end
        end

        def nil_class_display
          translate
        end

        def date_display
          localize
        end

        def time_display
          localize
        end

        def date_time_display
          localize
        end

        def string_display
          truncate(raw_value, length: string_length)
        end

        def method_name
          "#{class_name}_display"
        end

        def translate
          I18n.translate "data_display.#{class_name}.formats.#{locale_format}"
        end

        def localize
          I18n.localize raw_value, format: localize_format, scope: :data_display
        end

        def class_name
          raw_value.class.name.underscore
        end

        def locale_format
          format || :long
        end

        def localize_format
          format || :long
        end

        def string_format
          format || :long
        end

        def fixnum_format
          format || :delimiter
        end

        def string_length
          case string_format
          when :short
            60
          when :long
            180
          else
            raw_value.length
          end
        end
    end

    def __data_display__(value, format = nil)
      display = Display.new value, format
      display.value
    end
  end
end
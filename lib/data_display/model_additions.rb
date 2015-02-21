module DataDisplay
  module ModelAdditions
    include DataDisplay::Actions
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_displayable(*args)
        args = columns.map(&:name) if args.blank?
        args.each do |attribute|
          define_method "#{attribute}_display" do
            __data_display__(send(attribute))
          end
        end
      end
    end
  end
end


require 'pager/models/plucky_criteria_methods'

module Pager
  module MongoMapperExtension
    module Document
      extend ActiveSupport::Concern
      include Pager::ConfigurationMethods

      included do
        # Fetch the values at the specified page number
        #   Model.page(5)
        scope Pager.config.page_method_name, Proc.new {|num|
          limit(default_per_page).offset(default_per_page * ([num.to_i, 1].max - 1))
        }
      end
    end
  end
end

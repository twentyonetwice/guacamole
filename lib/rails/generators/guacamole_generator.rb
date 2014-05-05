# encoding: utf-8
require "rails/generators/named_base"
require "rails/generators/active_model"

module Guacamole
  module Generators
    class Base < ::Rails::Generators::NamedBase
      def self.source_root
        @_guacamole_source_root ||=
          File.expand_path("../#{base_name}/#{generator_name}/templates", __FILE__)
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute
      def type_class
        return 'Time' if type == :datetime
        return 'String' if type == :text
        return 'Boolean' if type == :boolean
        type.to_s.camelcase
      end
    end
  end
end

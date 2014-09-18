require 'rspec/expectations'

module RSpec
  module Core
    # @private
    module ExpectationAdapters
      # @private
      module RSpec
        include ::RSpec::Matchers

        def self.configuration
          ::RSpec::Expectations.configuration
        end

        def self.expectation_error
          ::RSpec::Expectations::ExpectationNotMetError
        end
      end
    end
  end
end

require 'test/unit/assertions'

module RSpec
  module Core
    module ExpectationAdapters
      # @private
      module TestUnit
        include ::Test::Unit::Assertions

        # If using test/unit from Ruby core with Ruby 1.9+, it includes
        # MiniTest::Assertions by default. Note the upcasing of 'Test'.
        #
        # If the test/unit gem is being loaded, it will not include any minitest
        # assertions.
        #
        # Only if Minitest 5.x is included / loaded do we need to worry about
        # adding a shim for the new updates. Thus instead of checking on the
        # RUBY_VERSION we need to check ancestors.
        begin
          # MiniTest is 4.x
          # Minitest is 5.x
          if ancestors.include?(::Minitest::Assertions)
            require 'rspec/core/expectation_adapters/minitest'
            include ::RSpec::Core::ExpectationAdapters::Minitest
          end
        rescue NameError
          # No-op. Minitest 5.x was not loaded
        end

        def expectation_error
          ::Test::Unit::AssertionFailedError
        end
      end
    end
  end
end

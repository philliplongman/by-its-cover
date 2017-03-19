# frozen_string_literal: true

RSpec.configure do |config|

  # Check that each factory works, before running any specs,
  # so that a broken factory doesn't make half the suite fail.

  config.before(:suite) do
    FactoryGirl.factories.map(&:name).each do |model|
      begin
        FactoryGirl.create model
      rescue => error
        def red(string); "\e[31m#{string}\e[0m"; end

        print red("Failure/Error: ")
        print "The #{model.capitalize} factory failed\n\n"
        print red("#{error.class}:\n")
        print red("  #{error.message}\n")

        exit
      end
    end
  end

end

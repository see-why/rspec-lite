# frozen-string_literal: true

module RspecLite
  class Context
    def initialize(description)
      @description = description
      @lets = {}
      @before_hooks = []
      @after_hooks = []
      @tests = []
    end

    def before(&block)
      @before_hooks << block
    end

    def after(&block)
      @after_hooks << block
    end

    def let(name, &block)
      @lets ||= {}
      @lets[name] = block

      define_singleton_method(name) do
        @memoized ||= {}
        @memoized[name] ||= instance_eval(&@lets[name])
      end
    end

    def run
      puts "Running context: #{@description}"

      @tests.each do |test|
        @memoized = nil

        @before_hooks.each { |hook| instance_eval(&hook) }

        begin
            instance_eval(&test[:block])

            puts "  #{test[:description]}: Passed"
        rescue => e
          puts "  #{test[:description]}: Failed - #{e.message}"
        end

        @after_hooks.each { |hook| instance_eval(&hook) }
      end
    end
  end
end

# frozen-string_literal: true

module RspecLite
  class Context
    def initialize(description)
      @description = description
      @lets = {}
      @before_hooks = []
      @after_hooks = []
      @tests = []
      @matchers = { eq: EqualMatcher }
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

    def it(description, &block)
      @tests << { description: description, block: block }
    end

    def run
      puts "Running context: #{@description}"

      @tests.each do |test|
        @memoized = nil

        @before_hooks.each { |hook| instance_eval(&hook) }
        eval_test_block(test[:description], test[:block])
        @after_hooks.each { |hook| instance_eval(&hook) }
      end
    end

    def expect(actual)
      RspecLite.expect(actual)
    end

    def method_missing(method_name, *args, &block)
      if matcher_class = @matchers[method_name]
        matcher_class.new(*args)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @matchers.key?(method_name) || super
    end

    private

    def eval_test_block(description, block)
      instance_eval(&block)

      puts "  #{description}: Passed"
    rescue => e
      puts "  #{description}: Failed - #{e.message}"
    end
  end
end

# frozen-string_literal: true

module RspecLite
  class Context
    def initialize(description)
      @description = description
      @lets = {}
      @before_hooks = []
      @after_hooks = []
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

      # Execute before hooks
      @before_hooks.each do |hook|
        instance_eval(&hook)
      end

      @lets.each do |name, value|
        puts "name: #{name} value: #{value.call}"
      end

      # Execute after hooks
      @after_hooks.each do |hook|
        instance_eval(&hook)
      end
    end
  end
end

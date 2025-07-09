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
      pp 'Before hooks', @before_hooks, 'After hooks', @after_hooks
    end
  end
end

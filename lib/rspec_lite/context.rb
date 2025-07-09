# frozen-string_literal: true

module RspecLite
  class Context
    def initialize(description)
      @description = description
      @lets = {}
    end

    def let(name, &block)
      @lets[name] = block

      define_singleton_method(name) do
        @memoized ||= {}
        @memoized[name] ||= instance_eval(&@lets[name])
      end
    end

    def run
    end
  end
end

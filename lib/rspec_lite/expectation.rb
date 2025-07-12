# frozen_string_literal: true

module RspecLite
  class Expectation
    def initialize(actual)
      @actual = actual
    end

    def to(matcher)
      return unless matcher.matches?(@actual)

      raise "Expected #{matcher.expected}, but got #{@actual}"
    end
  end
end

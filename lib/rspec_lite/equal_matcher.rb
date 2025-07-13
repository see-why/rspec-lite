# frozen_string_literal: true

module RspecLite
  class EqualMatcher
    attr_reader :expected

    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      actual == @expected
    end
  end

  def self.eq(expected)
    EqualMatcher.new(expected)
  end
end

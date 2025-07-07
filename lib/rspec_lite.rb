# frozen_string_literal; true

Dir[File.expand_path('lib/**/*.rb')].sort.each { |file| require file }

module RspecLite
  def self.describe(description, &block)
    context = Context.new(description)
    context.instance_eval(&block)

    context.run
  end

  def self.expect(actual)
    Expectation.new(actual)
  end
end

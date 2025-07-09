# frozen_string_literal: true
RspecLite.describe 'Let Test' do
  let(:number) { 42 }

  # Test that number returns the same object_id (proving it's memoized/singleton)
  def test_singleton_behavior
    first_call = number
    second_call = number
    third_call = number

    puts "First call object_id: #{first_call.object_id}"
    puts "Second call object_id: #{second_call.object_id}"
    puts "Third call object_id: #{third_call.object_id}"
    puts "Are they the same object? #{first_call.equal?(second_call)}"
    puts "Values: #{first_call}, #{second_call}, #{third_call}"
  end

  test_singleton_behavior
end

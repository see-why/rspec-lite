# frozen_string_literal: true

RspecLite.describe 'Let Test' do
  it 'saves variable' do
    let(:test_number) { 42 }
  end
end

RspecLite.describe 'Hook Test' do
  before { puts 'Running before each test' }
  after { puts 'Running after each test' }

  let(:starting_position) { 100 }
end

RspecLite.describe 'My Array' do
  let(:initial_array) { [1, 2, 3] }
  let(:initial_size) { 3 }
  let(:search_element) { 2 }
  let(:first_new_element) { 4 }
  let(:second_new_element) { 5 }
  let(:final_size) { 5 }

  before do
    puts 'Running setup before each test'
  end

  after do
    puts 'Running teardown after each test'
  end

  it 'has the correct size' do
    expect(initial_array.size).to(eq(initial_size))
  end

  it 'contains the expected element' do
    expect(initial_array.include?(search_element)).to(eq(true))
  end

  it 'can be appended to' do
    initial_array << first_new_element
    initial_array << second_new_element
    expect(initial_array.size).to(eq(final_size))
  end
end

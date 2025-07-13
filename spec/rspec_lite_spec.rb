# frozen_string_literal: true

RspecLite.describe 'Let Test' do
  it 'saves variable' do
    let(:number) { 42 }
  end
end

RspecLite.describe 'Hook Test' do
  before { puts 'Running before each test' }
  after { puts 'Running after each test' }

  let(:position) { 100 }
end

RspecLite.describe 'My Array' do
  let(:array) { [1, 2, 3] }

  before do
    puts 'Running setup before each test'
  end

  after do
    puts 'Running teardown after each test'
  end

  it 'has the correct size' do
    expect(array.size).to(eq(3))
  end

  it 'contains the number 2' do
    expect(array.include?(2)).to(eq(true))
  end

  it 'can be appended to' do
    array << 4
    expect(array.size).to(eq(5))
  end
end

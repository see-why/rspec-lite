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
  it 'is empty' do

  end
end

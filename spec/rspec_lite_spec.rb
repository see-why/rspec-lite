# frozen_string_literal: true
RspecLite.describe 'Let Test' do
  let(:number) { 42 }
end

RspecLite.describe 'Hook Test' do
  before { puts 'Running before each test' }
  after { puts 'Running after each test' }

  let(:position) { 100 }
end

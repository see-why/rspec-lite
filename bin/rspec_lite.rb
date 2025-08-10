#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/rspec_lite'

if ARGV.empty?
  Dir['./spec/**/*_spec.rb'].each { |file| load file }
else
  ARGV.each { |file| load file }
end

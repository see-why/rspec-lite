# RSpec Lite

A lightweight testing framework inspired by RSpec, built in Ruby.

## Features

- **Test Organization**: Use `describe` blocks to organize your tests
- **Individual Tests**: Write tests using `it` blocks
- **Memoized Variables**: Use `let` for lazy-evaluated, memoized variables
- **Test Hooks**: Support for `before` and `after` hooks
- **Expectations**: Simple expectation syntax with matchers
- **Automatic Test Discovery**: Runs all `*_spec.rb` files in the `spec/` directory

## Installation

Clone this repository:

```bash
git clone <repository-url>
cd rspec-lite
```

## Usage

### Writing Tests

Create test files in the `spec/` directory with the `_spec.rb` suffix:

```ruby
# spec/example_spec.rb
RspecLite.describe 'Calculator' do
  let(:result) { 2 + 2 }
  
  before { puts 'Setting up test' }
  after { puts 'Cleaning up test' }
  
  it 'adds numbers correctly' do
    expect(result).to eq(4)
  end
end
```

### Running Tests

Run all tests:

```bash
ruby bin/rspec_lite.rb
```

Run specific test files:

```bash
ruby bin/rspec_lite.rb spec/specific_test_spec.rb
```

## API Reference

### Core Methods

- **`RspecLite.describe(description, &block)`**: Creates a test context
- **`it(description, &block)`**: Defines an individual test
- **`let(name, &block)`**: Creates a memoized variable
- **`before(&block)`**: Runs code before each test
- **`after(&block)`**: Runs code after each test
- **`expect(actual)`**: Creates an expectation for testing

### Matchers

- **`eq(expected)`**: Tests for equality using `==`

## Example

```ruby
# spec/math_spec.rb
RspecLite.describe 'Math Operations' do
  let(:number) { 42 }
  
  before { puts 'Starting math test' }
  
  it 'returns the correct number' do
    expect(number).to eq(42)
  end
  
  it 'can be used multiple times' do
    first_call = number
    second_call = number
    expect(first_call.object_id).to eq(second_call.object_id)
  end
end
```

## Project Structure

```text
├── bin/
│   └── rspec_lite.rb          # Test runner executable
├── lib/
│   ├── rspec_lite.rb          # Main module
│   └── rspec_lite/
│       ├── context.rb         # Test context and DSL
│       ├── expectation.rb     # Expectation handling
│       └── equal_matcher.rb   # Equality matcher
├── spec/
│   └── rspec_lite_spec.rb     # Example tests
└── README.md
```

## Implementation Details

- **Memoization**: `let` variables are cached per test using `||=` pattern
- **Hook Execution**: `before` and `after` hooks run around each `it` block
- **Error Handling**: Failed tests display error messages while continuing execution
- **Matcher System**: Extensible matcher architecture for different assertion types

## Current Limitations

- Limited matcher set (only `eq` currently implemented)
- No nested `describe` blocks
- No `subject` or `context` aliases
- Basic error reporting

## Contributing

This is a learning project demonstrating how testing frameworks work internally. Feel free to extend it with additional matchers, nested contexts, or other RSpec features!

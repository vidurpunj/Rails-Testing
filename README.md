# Rspec Rails
Versions:
ruby 3.2.0\
Rails 7.0.4.2\
rspec-rails (6.0.1)

# install rspec
rails g rspec:install

# Generate Model
rails g rspec:model author

# Generate Controller
rails g rspec:controller author

# Run migrations in test environment
rails db:migrate RAILS_ENV=test

# Run spec models
rspec spec/models/

# Run spec controllers
rspec spec/models/

# Run spec controllers
rspec spec/controllers

# Capybara:
Acceptance test framework for web applications
Capybara helps you test web applications by simulating how a real user would interact with your app.
Capybara provides helper methods like fill_in to fill in a form field, click_on to click a button, etc.


# Rspec: BDD, its parent is TDD
Behaviour Driven Development for Ruby.
Behavior-driven development is an idea built on top of TDD.
Rails tests operate at a “low level”, meaning no browser interaction is involved.
Low-level tests can be executed with just RSpec

# Cucumber:
Cucumber is a tool for writing test cases in something close to English.
Cucumber can be connected with RSpec and Capybara and used to write integration tests.
Cucumber adds both a layer of mental overhead and a layer of maintenance overhead on top of the RSpec + Capybara combination.

#  MiniTest:
Minitest is the default testing suite used with Rails
only for Unit Testing
Minitest is small, fast, and it aims to make tests clean and readable. It supports test-driven development (TDD), behavior-driven development (BDD), mocking, and benchmarking.

#  test-unit:
A unit testing framework that’s part of Ruby’s standard library.
can be used for Unit Testing, Intergration Testing
if you are writing new test code use Minitest instead of Test::Unit
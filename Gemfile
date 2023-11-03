# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.2.2"

group :development, :test do
  gem "rspec"
  # gem "parallel_tests"
end

group :development do
  gem "standard", "~> 1.30", require: false
  gem "rubocop-rspec", "~> 2.0", require: false
  gem "rubocop-magic_numbers", "~> 0.3", require: false
  gem "rubocop-thread_safety", "~> 0.5", require: false
end

group :test do
  # gem "rspec-github", require: false
  gem "rspec-collection_matchers"
  gem "rspec-its"
end
if ENV['COVERAGE'] == 'on'
  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.start 'rails'

  if ENV['COVERAGE_FORMAT'] == 'rcov'
    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  end
end

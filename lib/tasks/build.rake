namespace :build do
  desc 'Setup build environment variables'
  task :env do
    ENV['RAILS_ENV'] = 'test'
    ENV['COVERAGE'] = 'on'
    ENV['COVERAGE_FORMAT'] = 'rcov'
  end

  begin
    require 'rspec/core/rake_task'

    desc 'Run specs for build env (outputs for junit)'
    RSpec::Core::RakeTask.new(spec: 'build:env') do |t|
      t.rspec_opts = '--require spec_helper --format progress --fail-fast --format RspecJunitFormatter --out report/TEST-unit.xml'
    end
  rescue LoadError
  end

  desc 'Run Brakeman for build env'
  task :brakeman do
    require 'brakeman'
    system 'mkdir -p report/'
    Brakeman.run(app_path: '.',
                 output_formats: [:to_tabs],
                 output_files: ['report/brakeman-output.tabs'])
  end
end

desc 'Build application'
task build: %w(build:env environment cane build:brakeman db:test:prepare build:spec)

require 'bundler/setup'

task :default => "features:done"

require "cucumber/rake/task"
namespace :features do
  Cucumber::Rake::Task.new(:production, "Run regression tests (on production server)") do |task|
    task.cucumber_opts = ["--tags ~@backlog SITE=tellme.wherewhere.is"]
  end

  Cucumber::Rake::Task.new(:done, "Run regression tests (on local server - 'rackup' first)") do |task|
    task.cucumber_opts = ["--tags ~@backlog"]
  end

  Cucumber::Rake::Task.new(:backlog, "Run backlog tests (on local server - 'rackup' first)") do |task|
    task.cucumber_opts = ["--tags @backlog"]
  end
end

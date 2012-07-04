require 'bundler/setup'

task :default => "features:done"

desc "Run test server"
task :testserver do
  exec 'rackup configtest.ru'
end

require "cucumber/rake/task"
namespace :features do

  Cucumber::Rake::Task.new(:done, "Run regression tests") do |task|
    task.cucumber_opts = ["--tags ~@backlog"]
  end

  Cucumber::Rake::Task.new(:backlog, "Run backlog tests") do |task|
    task.cucumber_opts = ["--tags @backlog"]
  end
end

require 'bundler/setup'

task :default => "features:done"

require "cucumber/rake/task"
namespace :features do
  Cucumber::Rake::Task.new(:done) do |task|
    task.cucumber_opts = ["--tags ~@backlog"]
  end

  Cucumber::Rake::Task.new(:production) do |task|
    task.cucumber_opts = ["--tags ~@backlog SITE=wherewhere.herokuapp.com"]
  end

  Cucumber::Rake::Task.new(:backlog) do |task|
    task.cucumber_opts = ["--tags @backlog"]
  end
end

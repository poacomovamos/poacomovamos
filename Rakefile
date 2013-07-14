#!/usr/bin/env rake
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "test/features --format pretty --tag ~@pending"
end

#!/usr/bin/env rake
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format pretty --tag ~@pending"
end

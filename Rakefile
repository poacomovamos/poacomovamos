#!/usr/bin/env rake
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "test/features --format pretty --tag ~@pending"
end

desc "Test the Javascript using mocha-phantomjs"
task :jstest do
   sh 'mocha test/ -R nyan --recursive'
end

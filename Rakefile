#!/usr/bin/env rake
require 'cucumber'
require 'cucumber/rake/task'

desc "Roda todos os testes (javascript e cucumber)"
task :test => [:features, :jstest]

Cucumber::Rake::Task.new(:features) do |t|
  puts "===== Testes de Pepino ====="
    t.cucumber_opts = "test/features --format pretty --tag ~@pending"
end

desc "Roda os testes de javascript"
task :jstest do
  puts "===== Testes de Javascript ====="
  sh 'karma start'
end

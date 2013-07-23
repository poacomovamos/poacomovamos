require 'cucumber'
require 'cucumber/rake/task'

desc "Roda todos os testes (javascript e cucumber)"
task :test => [:features, :jstest]

Cucumber::Rake::Task.new(:features) do |t|
  puts "===== Testes de Pepino ====="
  t.cucumber_opts = "features --format pretty --tag ~@pending"
end

desc "Roda os testes de javascript"
task :jstest do
  puts "===== Testes de Javascript ====="
  sh 'karma start'
end

task :environment do
  require './environment'
end

desc "Puxa os dados de sessão"
task :puxar_sessoes => :environment do
  LeitorSessoes.puxar_sessoes
end

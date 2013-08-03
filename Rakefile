require 'cucumber'
require 'cucumber/rake/task'
require 'mongo'
require 'csv'
include Mongo

#MongoMapper.setup( { 'mongo' => { 'uri' => ENV['MONGOLAB_URI'] || 'mongodb://localhost/pcv' } }, 'mongo')
uri = ENV['MONGOLAB_URI'] || 'mongodb://localhost/pcv'
puts uri

desc "Roda todos os testes (javascript e cucumber)"
task :test => [:features, :jstest]

desc "Roda os testes de pepino"
task :features do
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty --tag ~@pending"
  end
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

desc "Importa dados da planilha (db/vereadores.csv)"
task :importar_vereadores do
  puts "Deletando vereadores..."
  uri = ENV['MONGOLAB_URI'] || 'mongodb://localhost/pcv'
  db_name = uri[%r{/([^/\?]+)(\?|$)}, 1]
  client = MongoClient.from_uri(uri)
  db = client.db(db_name)
  puts db_name
  db.drop_collection('vereadors')
  puts "Importando planilha"
  data = CSV.read("db/vereadores.csv", :headers => true)

  col  = db.collection('vereadors')
  data.each do |row|
    h = row.to_hash
    col.save(h)
  end
  #sh 'mongoimport -d pcv -c vereadors --type csv --file db/vereadores.csv --headerline'
end

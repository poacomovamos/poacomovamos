require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'json'
require 'rufus-scheduler'


scheduler = Rufus::Scheduler.new
scheduler.cron '5 0 * * *' do
  # todo dia, cinco minutos depois da meia noite
  LeitorSessoes.puxar_sessoes
end


get '/' do
  erb :index
end

get '/api/vereador' do
  content_type :json
  Vereador.all.to_json
end

get '/api/perfil/:email' do
  content_type :json
  #pegar vereador e projetos do banco, exemplo de estrtura

  Vereador.first(:email => params[:email]).to_json


end

get '/api/sessoes' do
  content_type :json
  Sessao.all.to_json
end

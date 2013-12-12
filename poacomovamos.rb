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
  { vereador: {
    email: "ferronato@camarapoa.rs.gov.br",
    facebook: "https://www.facebook.com/airtoferronato",
    foto: "airtoferronato2.jpg",
    id: "52a09faf93072f18e5000001",
    nome: "Airto Ferronato",
    partido: "PSB",
    telefone: "4221/4222/4223",
    twitter: "@AirtoFerronato",
    projetosVotos: {
      voto: 10,
      absteve: 20,
      repExterna: 30,
      ausente: 40
    }
  }}.to_json
end

get '/api/sessoes' do
  content_type :json
  Sessao.all.to_json
end

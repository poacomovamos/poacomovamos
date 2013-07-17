require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  erb :"index"
end

get '/api/vereador' do
  content_type :json
  [
    { :nome => 'Airto Ferronato', :email => 'ferronato@camarapoa.rs.gov.br', :partido => 'PAB', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/airtoferronato2.jpg', :presencaUltimaSessao => true,  :presencasDuranteMandato => 5 },
    { :nome => 'Jose Sarney', :email => 'brasinha@camarapoa.rs.gov.br',  :partido => 'PTB', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/brasinha.jpg',        :presencaUltimaSessao => false, :presencasDuranteMandato => 2 },
    { :nome => 'Lula', :email => 'brasinha@camarapoa.rs.gov.br',  :partido => 'PTB', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/brasinha.jpg',        :presencaUltimaSessao => false, :presencasDuranteMandato => 2 },
    { :nome => 'FHC', :email => 'brasinha@camarapoa.rs.gov.br',  :partido => 'PTB', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/brasinha.jpg',        :presencaUltimaSessao => false, :presencasDuranteMandato => 2 },
    { :nome => 'Alceu Brasinha', :email => 'brasinha@camarapoa.rs.gov.br',  :partido => 'PTB', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/brasinha.jpg',        :presencaUltimaSessao => false, :presencasDuranteMandato => 2 },
    { :nome => 'Bernardino Vendruscolo', :email => '', :partido => 'PSD', :foto => 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/bernardino.jpg', :presencaUltimaSessao => true, :presencasDuranteMandato => 8 }
  ].to_json
end

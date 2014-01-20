class Projeto
  include MongoMapper::Document
  key :nome_projeto, String
  key :ementa_projeto, String
  key :status_projeto, String
  key :autor_projeto, String
  key :data_abertura_projeto, String
  key :data_ultima_tramitacao_projeto, String
  key :data_de_votacao, String
  key :link, String
  many :votos
end

class Voto
  include MongoMapper::Document
  key :id_vereador, String
  key :tipo_voto, String
  belongs_to :projeto
end

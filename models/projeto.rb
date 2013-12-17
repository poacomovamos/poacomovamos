class Projeto
  include MongoMapper::Document
    key :nome_projeto, String
    key :ementa, String
    key :status, String
    key :autor, String
    many :votos
end

class Voto
    include MongoMapper::Document
    key :id_vereador, String
    key :tipo_voto, String
    belongs_to :projeto
end

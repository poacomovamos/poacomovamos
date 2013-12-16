class Projeto
  include MongoMapper::Document
  key :nome_projeto, String
  key :ementa, String
  key :status, String
  key :autor, String
  key :votos, Array
end

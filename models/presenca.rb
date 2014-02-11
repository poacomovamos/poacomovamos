class Presenca
  include MongoMapper::Document
  key :sessao, String
  key :votacao, String
  key :parlamentar, String
  key :presenca, Boolean
end
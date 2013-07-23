class Sessao
  include MongoMapper::Document
  
  key :tipo, String
  key :data, Date
end
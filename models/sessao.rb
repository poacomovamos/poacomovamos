class Sessao
  include MongoMapper::Document
  key :numero, String
  key :tipo, String
  key :data, Date
end

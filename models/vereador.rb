class Vereador
  include MongoMapper::Document
  
  key :nome, String
  key :email, String
  key :partido, String
  key :foto, String
  key :twitter, String
  key :site, String
end
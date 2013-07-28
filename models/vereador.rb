class Vereador
  include MongoMapper::Document
  
  key :nome, String
  key :partido, String
  key :email, String
  key :telefone, String
  key :foto, String
  key :twitter, String
  key :site, String
end

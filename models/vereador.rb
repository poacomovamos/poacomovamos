class Vereador
  include MongoMapper::Document
  key :nome, String
  key :partido, String
  key :email, String
  key :telefone, String
  key :twitter, String
  key :facebook, String
  key :foto, String
  key :presente_ultima_sessao, Boolean
end

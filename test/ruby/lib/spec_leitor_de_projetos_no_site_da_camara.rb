require './environment'
require_relative '../../../lib/leitor_de_projetos_camara'

describe LeitorDeProjetos do 
	it "testando biblioteca" do
		leitor_de_projetos = LeitorDeProjetos.new
		leitor_de_projetos.sessoes.should eq(5)
	end
end
require 'test/unit'
require_relative '../../../environment'
require_relative '../../../lib/leitor_de_projetos_camara'

class SpecLeitorDeProjetosDaCamara < Test::Unit::TestCase
	def setup
		MongoMapper.database.collections.each(&:remove)
	end
	
	def test_salva_os_projetos_da_camara_no_banco 
		leitor = LeitorDeProjetosCamara.new
		
		#leitor.executa_todo_script
		
		assert_equal(Projeto.all.count, 10)
	end
end
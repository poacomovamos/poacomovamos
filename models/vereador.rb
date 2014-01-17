require 'rubygems'
require 'mongo_mapper'
require './environment'

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

	def busca_do_banco_de_votos_em_projetos
		@nome_vereador = @nome
		@busca_do_banco_os_votos_do_projeto = Array.new()
		@busca_do_banco_os_votos_do_projeto = db.votos.find({nomeVereador => "Marcelo Sgarbossa" } )
		#db.votos.all(:nomeVereador => @nome_vereador ).tipo_voto
		#db.votos.find({nomeVereador : @nome_vereador } )

		@voto = OpenStruct.new
		@busca_do_banco_os_votos_do_projeto.each { |votos_do_projeto|
			if (votos.include? "sim")
				@voto.sim = votos_do_projeto
			elsif "Ausente" == votos_do_projeto
				@voto.ausente = votos_do_projeto
			elsif votos_do_projeto.include? "Absten"
				@voto.abstencao = votos_do_projeto
			elsif votos_do_projeto.include? "Representa"
				@voto.representacao_externa = votos_do_projeto
			elsif votos_do_projeto.include? "N"
				if @tipodevoto.length == 3
					@voto.nao = votos_do_projeto
				else
					@voto.nao_votou = votos_do_projeto
				end
			end
		}
	end

	def nao_votou
		@voto.nao_votou
	end

	def nao
		@voto.nao
	end

	def sim
		puts @voto.sim
		@voto.sim
	end

	def abstencao
		@voto.abstencao
	end

	def representacao_exerna
		@voto.representacao_exerna
	end

	def ausente
		@voto.ausente
	end

	def votos
		busca_do_banco_de_votos_em_projetos
		nao_votou
		votou
		nao
		sim
		abstencao
		representacao_exerna
		ausente
	end


end

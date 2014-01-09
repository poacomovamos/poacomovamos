require 'rubygems'
require 'open-uri'
require "test/unit"
require_relative 'buscadedadoscamara'

class TestMain < Test::Unit::TestCase

	def setup
		@site = Buscadedados.new
	end


	def testar_busca_links_da_sessao
		links_da_sessao = @site.buscar_links_da_sessao
		assert_not_nil(links_da_sessao)
		assert(links_da_sessao.length >= 300)
	end


	def testa_quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres
		numero_e_ano = @site.quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres("PPL. 0123/13")
		assert_equal('00123', numero_e_ano[0])
		assert_equal('2013', numero_e_ano[1], "mensagem")
	end



	





end

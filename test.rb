require 'rubygems'
require 'open-uri'
require "test/unit"
require_relative 'buscadedadoscamara'

class TestMain < Test::Unit::TestCase

	def setup
		@site = Buscadedados.new
	end

	def testa_primeiro_link
		assert_equal('/votacoes?data=05%2F12%2F2013+00%3A00%3A00&numero=120&tiposessao=O', @site.ultima_sessao)
	end

	def testa_link_ultima_sessao
		@site.ultima_sessao
		assert_equal('http://votacoes.camarapoa.rs.gov.br/votacoes?data=05%2F12%2F2013+00%3A00%3A00&numero=120&tiposessao=O', @site.link_ultima_sessao)
	end

	def testa_link_com_proj
		@site.abrir_o_link_da_ultima_sessao_com_projeto 
		assert_equal('PLL 157/13 - PROC. 1587/13',@site.abrir_o_ultimo_projeto_da_ultima_sessao)
	end

	def testa_abrir_o_proj_daquela_sessao
		@site.pegar_o_ultimo_projeto_da_ultima_sessao
		assert_equal('http://votacoes.camarapoa.rs.gov.br/parlamentares?data=04%2F12%2F2013+00%3A00%3A00&sessao=119&tiposessao=O&tipovotacao=N&votacao=N194',@site.pegar_o_ultimo_projeto_da_ultima_sessao)
	end

	def  testa_pegar_o_link_das_presencas
		@site.abrir_o_link_da_ultima_sessao_com_projeto
		@site.abrir_o_ultimo_projeto_da_ultima_sessao
		@site.pegar_o_ultimo_projeto_da_ultima_sessao
		@site.abrir_o_link_do_projeto
		@site.pegar_o_link_das_presencas_dos_vereadores_naquele_projeto

		assert_equal('/parlamentares_nome?data=04%2F12%2F2013+00%3A00%3A00&sessao=119&tiposessao=O&tipovotacao=N&votacao=N201', @site.pegar_o_link_das_presencas_dos_vereadores_naquele_projeto.to_s)
	end
end

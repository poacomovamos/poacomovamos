require 'rubygems'
require 'open-uri'
require "test/unit"
require_relative '../../../lib/leitor_de_projetos_camara'

class TestMain < Test::Unit::TestCase

	def setup
		@site = LeitorDeProjetosCamara.new
	end


	def testar_busca_links_da_sessao
		links_da_sessao = @site.buscar_link_das_sessoes
		assert_not_nil(links_da_sessao)
		assert(links_da_sessao.length >= 20)
	end


	def testa_quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres
		numero_e_ano = @site.quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres("PLL 273/13 - PROC. 2423/13")
		assert_equal('02423', numero_e_ano[0])
		assert_equal('2013', numero_e_ano[1])
	end


	def testa_retornando_link_sem_lixo
		link = "<a onclisssssssssssck=ssddddd\"windowddddddd.open(&amp;apos;http://200.169.19.94/processo_eletronico/018822013PLL/018822013PLL_PROJETO_723876564_412.pdf&amp;apos;,&amp;apos;janela&amp;apos;,&amp;apos;target=_blank&amp;apos;)\" href=\"#\" class=\"p>"
		assert_equal("http://200.169.19.94/processo_eletronico/018822013PLL/018822013PLL_PROJETO_723876564_412.pdf", @site.pegar_link_do_projeto(link))
	end


end

require 'rubygems'
require 'nokogiri'
require 'open-uri'
#require_relative 'vereador'

class Buscadedados
	def initialize
		@base_URL = 'http://votacoes.camarapoa.rs.gov.br'
		@html_da_camara = Nokogiri::HTML(open(@base_URL + '/votacoes'))

	end

	def ultima_sessao
		@link_da_sessao = @html_da_camara.css('a.sessoes')[0].attr("href").to_s
	end

	def link_ultima_sessao
		@desc_do_link_do_projeto = @base_URL + @link_da_sessao
	end

	def abrir_o_link_da_ultima_sessao_com_projeto
		@html_da_sessao = Nokogiri::HTML(open(@base_URL + '/votacoes?data=04%2F12%2F2013+00%3A00%3A00&numero=119&tiposessao=O'))
	end

	def pegar_desc_do_ultimo_projeto_da_ultima_sessao
		@desc_do_link_da_sessao = @html_da_sessao.css('table.list tr td span.detalhe a')[6].text
	end

	def pegar_o_ultimo_projeto_da_ultima_sessao
		@link_do_projeto = @html_da_sessao.css('table.list tr td span.detalhe a')[6].attr("href")
	end

	def abrir_o_link_do_projeto
		@html_do_projeto = Nokogiri::HTML(open(@base_URL + @link_do_projeto.to_s))
	end

	def pegar_o_link_que_ordena_por_nome_as_presencas_dos_vereadores_naquele_projeto
		@desc_do_link_das_presencas = @html_do_projeto.css('div.box.no-box ul a').attr("href")
	end

	def correr_a_lista_de_presencas_do_projeto
		@html_da_lista_do_projeto = Nokogiri::HTML(open(@base_URL + @desc_do_link_das_presencas ))
	end

	def salva_dados_do_projeto
		@nome = @html_do_projeto.css('div.box.no-box b').text
		#@descricao = @html_do_projeto.css()
		@status = @html_do_projeto.css('div.box.no-box')[10].text
		#@autor = @html_do_projeto.css()
		@voto.sim = @html_do_projeto.css()
		@voto.nao = @html_do_projeto.css()
		@voto.abistevese = @html_do_projeto.css()
		@voto.ausente = @html_do_projeto.css()
		@voto.representante_externo = @html_do_projeto.css()
	end




end	

bd = Buscadedados.new 
bd.ultima_sessao
bd.link_ultima_sessao
bd.abrir_o_link_da_ultima_sessao_com_projeto
bd.pegar_desc_do_ultimo_projeto_da_ultima_sessao
bd.pegar_o_ultimo_projeto_da_ultima_sessao
bd.abrir_o_link_do_projeto
bd.pegar_o_link_que_ordena_por_nome_as_presencas_dos_vereadores_naquele_projeto

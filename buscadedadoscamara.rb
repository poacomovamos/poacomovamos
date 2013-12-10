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

		puts @nome = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		#@descricao = @html_do_projeto.css()
		@status = @html_do_projeto.css('div.box.no-box').text
		#@autor = @html_do_projeto.css()

		#pegar os dados da tabela e separar pelo tipo de voto do veriador e salvar o id dele		

=begin
		@tipodevoto = ''
		for i in 0...35

   		@tipodevoto = @html_da_lista_do_projeto.css('table.list tr td:nth-child(3)')[i].text

   		puts '----------------------------------------------------------------'

   		if "Sim" == @tipodevoto
   			puts "Sim"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[i].text
   		end

   		if @tipodevoto.include? "voto"
   			puts "Nao votou"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[i].text
   		end

   		if "Ausente" == @tipodevoto
   			puts "Ausente"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[i].text
   		end

   		if @tipodevoto.include? "Absten"
   			puts "Abstencao"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[i].text
   		end

   		if @tipodevoto.include? "Representa"
   			puts "Representacao externa"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[i].text
   		end 
   	end
=end   	
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

bd.correr_a_lista_de_presencas_do_projeto
bd.salva_dados_do_projeto
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#require_relative 'vereador'



class Buscadedados
	def initialize
		@base_URL = 'http://votacoes.camarapoa.rs.gov.br'
		@html_da_camara = Nokogiri::HTML(open(@base_URL + '/votacoes'))

	end





	def buscar_o_link_da_sessao
		i = 0
		count = 1
		@link_da_sessao = Array.new(700)
		nodo_vazio = Nokogiri::XML::NodeSet
		numero_da_ultima_pagina = @html_da_camara.css('div.pagination a:nth-last-of-type(2)')[0].text.to_i 	
		while (count <= numero_da_ultima_pagina)
			j = 0
			
			while (@html_da_camara.css('div.box.no-box a.sessoes')[j] != nil)   
				@link_da_sessao[i] = @base_URL + @html_da_camara.css('p a.sessoes')[j].attr("href").to_s
				i = i + 1
				j = j + 1
			end
			if (numero_da_ultima_pagina != count)
				@html_da_camara = Nokogiri::HTML(open(@base_URL + @html_da_camara.css('div.pagination a.next_page').attr("href")))
			end
			count = count + 1
		end
		@link_da_sessao = @link_da_sessao.compact
		puts @link_da_sessao 		
	end



	def abrir_o_link_da_sessao
		@html_da_sessao = Nokogiri::HTML(open(@base_URL + '/votacoes?data=04%2F12%2F2013+00%3A00%3A00&numero=119&tiposessao=O'))
	end






#Deletar ver como pegar link pegar links das sessões
	def pegar_descricao_dos_projetos_da_sessao
		
		@desc_do_link_da_sessao = Array.new
		@link_do_projeto = Array.new
		i = 0
		while (@html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[i] != nil or @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[i+1] != nil)  
			puts @desc_do_link_da_sessao[i] = @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[i].text
			if @desc_do_link_da_sessao[i].include? "PLCL" or @desc_do_link_da_sessao[i].include? "PLL"				
				unless @link_do_projeto.include?(@html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[i].attr("href"))
					@link_do_projeto[i] = @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[i].attr("href")
				end
			end
			i = i + 1
		end

	 @link_do_projeto
	end


#Deletar Ver como pegar o link do ultimo projeto
	def pegar_o_ultimo_projeto_da_ultima_sessao
		@link_do_projeto = @html_da_sessao.css('table.list tr td span.detalhe a')[6].attr("href")
	end



	#deletar
	def abrir_o_link_do_projeto
		@html_do_projeto = Nokogiri::HTML(open(@base_URL + @link_do_projeto.to_s))
	end

	def pegar_o_link_que_ordena_por_nome_as_presencas_dos_vereadores_naquele_projeto
		@desc_do_link_das_presencas = @html_do_projeto.css('div.box.no-box ul a').attr("href")
	end

	def correr_a_lista_de_presencas_do_projeto
		@html_da_lista_do_projeto = Nokogiri::HTML(open(@base_URL + @desc_do_link_das_presencas ))
	end

#finalizado?
	def abrir_o_link_de_detalhes_do_projeto
		@nome_do_processo = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		numeroProcesso_e_ano = @nome_do_processo.split('.')[1].split('/')
		numero_processo = numeroProcesso_e_ano[0]
		numero_processo_sem_espaco = numero_processo[1..-1]
		while (numero_processo_sem_espaco.length < 5) 
			numero_processo_sem_espaco = '0' + numero_processo_sem_espaco
		end
		puts numero_processo_sem_espaco
		puts ano = numeroProcesso_e_ano[1]
		@html_detalhes_do_projeto = Nokogiri::HTML(open('http://votacoes.camarapoa.rs.gov.br/votacoes/get_detalhes_processo?numero='+ numero_processo_sem_espaco +'&ano=20'+ano, {'X-Requested-With' => 'XMLHttpRequest'}))
	end

	def pegar_a_desc_do_link_dos_detalhes_do_projeto
		
	end

	def pegar_o_link_dos_detalhes_do_projeto

	end

	def salva_dados_do_projeto

		puts @nome = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		puts @ementa = @html_detalhes_do_projeto.css('table.attributes tr td')[4].text
		puts @status = @html_detalhes_do_projeto.css('table.attributes tr td')[6].text
		puts @autor = @html_detalhes_do_projeto.css('table.attributes tr td')[3].text
		
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
bd.buscar_o_link_da_sessao
=begin
#puts bd.link_ultima_sessao

bd.link_ultima_sessao
bd.abrir_o_link_da_ultima_sessao_com_projeto
bd.pegar_descricao_dos_projetos_da_sessao
bd.pegar_o_ultimo_projeto_da_ultima_sessao
bd.abrir_o_link_do_projeto
bd.pegar_o_link_que_ordena_por_nome_as_presencas_dos_vereadores_naquele_projeto
bd.abrir_o_link_de_detalhes_do_projeto
bd.correr_a_lista_de_presencas_do_projeto
#bd.salva_dados_do_projeto
=end

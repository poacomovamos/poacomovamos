require 'rubygems'
require 'nokogiri'
require 'open-uri'

#require_relative 'vereador'



class Buscadedados
	def initialize
		@base_URL = 'http://votacoes.camarapoa.rs.gov.br'
		@html_da_camara = Nokogiri::HTML(open(@base_URL + '/votacoes'))

	end

	#Primeira camada
	def buscar_link_das_sessoes
		indice_controle_da_posicao_do_array = 0
		contador_de_paginas = 1
		@link_da_sessao = Array.new
		nodo_vazio = Nokogiri::XML::NodeSet
		numero_da_ultima_pagina = @html_da_camara.css('div.pagination a:nth-last-of-type(2)')[0].text.to_i 	
		while (contador_de_paginas <= numero_da_ultima_pagina)
			indice_dos_links_na_pagina = 0
			
			while (@html_da_camara.css('div.box.no-box a.sessoes')[indice_dos_links_na_pagina] != nil)   
				@link_da_sessao[indice_controle_da_posicao_do_array] = @base_URL + @html_da_camara.css('p a.sessoes')[indice_dos_links_na_pagina].attr("href").to_s
				indice_controle_da_posicao_do_array = indice_controle_da_posicao_do_array + 1
				indice_dos_links_na_pagina += 1
			end
			if (numero_da_ultima_pagina != contador_de_paginas)
				@html_da_camara = Nokogiri::HTML(open(@base_URL + @html_da_camara.css('div.pagination a.next_page').attr("href")))
			end
			contador_de_paginas += 1
		end
		@link_da_sessao 		
	end

#Done Segunda Camada
	def pegar_links_dos_projetos_da_sessao(link_da_sessao)
		@html_da_sessao = Nokogiri::HTML(open(link_da_sessao))
		@desc_do_link_da_sessao = Array.new
		@link_do_projeto = Array.new
		indice_do_link_da_sessao = 0
		while (@html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao] != nil or @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao+1] != nil)  
			@desc_do_link_da_sessao[indice_do_link_da_sessao] = @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].text
			if @desc_do_link_da_sessao[indice_do_link_da_sessao].include? "PLCL" or @desc_do_link_da_sessao[indice_do_link_da_sessao].include? "PLL"				
				unless @link_do_projeto.include?(@html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].attr("href"))
					@link_do_projeto[indice_do_link_da_sessao] = @base_URL + @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].attr("href")
				end
			end
			indice_do_link_da_sessao += 1
		end
		@link_do_projeto = @link_do_projeto.compact
	 	@link_do_projeto
	end

	#Done alienta desc_do_link_das_resencas e 
	# => Alimenta html_da_lista_do_projeto
	def abrir_link_de_ordenacao_lista_de_presencas_do_projeto
		@desc_do_link_das_presencas = @html_do_projeto.css('div.box.no-box ul a').attr("href")
		@html_da_lista_do_projeto = Nokogiri::HTML(open(@base_URL + @desc_do_link_das_presencas ))
	end

	#Done alimenta @html_detalhes_do_projeto e abre
	def abrir_o_link_de_detalhes_do_projeto
		nome_do_processo = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		numeroProcesso_e_ano = quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres (numero_do_processo_e_ano)
		puts 'http://votacoes.camarapoa.rs.gov.br/votacoes/get_detalhes_processo?numero='+numeroProcesso_e_ano[0] +'&ano='+numeroProcesso_e_ano[1]
		@html_detalhes_do_projeto = Nokogiri::HTML(open('http://votacoes.camarapoa.rs.gov.br/votacoes/get_detalhes_processo?numero='+numeroProcesso_e_ano[0] +'&ano='+numeroProcesso_e_ano[1], {'X-Requested-With' => 'XMLHttpRequest'}))
	end

	#Done retorna numero do processo e ano
	def quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres (numero_do_processo_e_ano)
		numeroProcesso_e_ano_array = numero_do_processo_e_ano.split('.')[1].split('/')
		numeroProcesso_e_ano_array[0] = numeroProcesso_e_ano_array[0][1..-1]
		while (numeroProcesso_e_ano_array[0].length < 5) 
			numeroProcesso_e_ano_array[0] = '0' + numeroProcesso_e_ano_array[0]
		end
		numeroProcesso_e_ano_array[1] = '20' + numeroProcesso_e_ano_array[1] 
		numeroProcesso_e_ano_array
	end

	#Done nao retorna - ultima camada
	def salva_dados_do_projeto (link_do_projeto)
		@html_do_projeto = Nokogiri::HTML(open(link_do_projeto.to_s))
		abrir_link_de_ordenacao_lista_de_presencas_do_projeto
		
		puts @nome_do_projeto = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		@tipodevoto = ''
		for indice_do_tipo_de_voto_na_pagina in 0...34

   		@tipodevoto = @html_da_lista_do_projeto.css('table.list tr td:nth-child(3)')[indice_do_tipo_de_voto_na_pagina].text

   		puts '----------------------------------------------------------------'

   		if "Sim" == @tipodevoto
   			puts "Sim"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
   		end

   		if @tipodevoto.include? "voto"
   			puts "Nao votou"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
   		end

   		if "Ausente" == @tipodevoto
   			puts "Ausente"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
   		end

   		if @tipodevoto.include? "Absten"
   			puts "Abstencao"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
   		end

   		if @tipodevoto.include? "Representa"
   			puts "Representacao externa"
   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
   		end 
   	end
   		
   	abrir_o_link_de_detalhes_do_projeto
   	
   	puts @ementa_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[4].text
		puts @status_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[6].text
		puts @autor_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[3].text
		puts @data_de_abertura_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[2].text
		puts @data_de_ultima_tramitacao_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[8].text
	
   		
	end
end	

bd = Buscadedados.new 

=begin
link_das_sessoes = bd.buscar_link_das_sessoes
link_das_sessoes.each do |link_da_sessao|
	puts "Link da Sessao  ---- " + link_da_sessao.to_s
  link_dos_projetos = bd.pegar_links_dos_projetos_da_sessao(link_da_sessao)
  link_dos_projetos.each do |link_do_projeto|
  	puts "Link do Projeto ---- " + link_do_projeto.to_s
  	bd.salva_dados_do_projeto(link_do_projeto)
  end
=end

puts bd.salva_dados_do_projeto("http://votacoes.camarapoa.rs.gov.br/parlamentares?data=11%2F12%2F2013+00%3A00%3A00&sessao=122&tiposessao=O&tipovotacao=N&votacao=N197-EME-+01SUB.01")







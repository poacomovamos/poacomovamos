require 'rubygems'
require 'nokogiri'
require 'open-uri'



class LeitorDeProjetosCamara
	def initialize
		@base_URL = 'http://votacoes.camarapoa.rs.gov.br'
		@html_da_camara = Nokogiri::HTML(open(@base_URL + '/votacoes'))
	end


	def buscar_link_das_sessoes
		indice_controle_da_posicao_do_array = 0
		contador_de_paginas = 1
		@link_da_sessao = Array.new
		nodo_vazio = Nokogiri::XML::NodeSet
		numero_da_ultima_pagina = @html_da_camara.css('div.pagination a:nth-last-of-type(2)')[0].text.to_i
		while contador_de_paginas <= numero_da_ultima_pagina
			indice_dos_links_na_pagina = 0

			while @html_da_camara.css('div.box.no-box a.sessoes')[indice_dos_links_na_pagina] != nil
				if @html_da_camara.css('p a.sessoes')[indice_dos_links_na_pagina].text.split.last.to_i >= 2013
					@link_da_sessao[indice_controle_da_posicao_do_array] = @base_URL + @html_da_camara.css('p a.sessoes')[indice_dos_links_na_pagina].attr("href").to_s
					indice_controle_da_posicao_do_array = indice_controle_da_posicao_do_array + 1
				end
				indice_dos_links_na_pagina += 1
			end
			if numero_da_ultima_pagina != contador_de_paginas
				@html_da_camara = Nokogiri::HTML(open(@base_URL + @html_da_camara.css('div.pagination a.next_page').attr("href")))
			end
			contador_de_paginas += 1
		end
		@link_da_sessao
	end


	def pegar_links_dos_projetos_da_sessao(link_da_sessao)
		@html_da_sessao = Nokogiri::HTML(open(link_da_sessao))
		@desc_do_link_da_sessao = Array.new
		@link_do_projeto = Array.new
		indice_do_link_da_sessao = 0
		while @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao] != nil or @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao+1] != nil
			@desc_do_link_da_sessao[indice_do_link_da_sessao] = @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].text
			if @desc_do_link_da_sessao[indice_do_link_da_sessao].include? "PROC"
				unless @link_do_projeto.include?(@html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].attr("href"))
					@link_do_projeto[indice_do_link_da_sessao] = @base_URL + @html_da_sessao.css('table.list tr td:nth-child(2) span.detalhe a')[indice_do_link_da_sessao].attr("href")
				end
			end
			indice_do_link_da_sessao += 1
		end
		puts @link_do_projeto = @link_do_projeto.compact
	 	@link_do_projeto
	end


	def abrir_link_de_ordenacao_lista_de_presencas_do_projeto
		@desc_do_link_das_presencas = @html_do_projeto.css('div.box.no-box ul a').attr("href")
		@html_da_lista_do_projeto = Nokogiri::HTML(open(@base_URL + @desc_do_link_das_presencas ))
	end


	def abrir_o_link_de_detalhes_do_projeto
		nome_do_processo = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		numeroProcesso_e_ano = quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres (nome_do_processo)
		puts 'http://votacoes.camarapoa.rs.gov.br/votacoes/get_detalhes_processo?numero='+numeroProcesso_e_ano[0] +'&ano='+numeroProcesso_e_ano[1]
		@html_detalhes_do_projeto = Nokogiri::HTML(open('http://votacoes.camarapoa.rs.gov.br/votacoes/get_detalhes_processo?numero='+numeroProcesso_e_ano[0]+'&ano='+numeroProcesso_e_ano[1], {'X-Requested-With' => 'XMLHttpRequest'}))
	end


	def quebrar_e_garantir_que_o_numero_do_projeto_tem_cinco_caracteres (numero_do_processo_e_ano)
		if numero_do_processo_e_ano.include?('PROC.')
			numeroProcesso_e_ano_array = numero_do_processo_e_ano.split('PROC.')[1].split('/')
		elsif numero_do_processo_e_ano.include?('PROCESSO')
			numeroProcesso_e_ano_array = numero_do_processo_e_ano.split('PROCESSO')[1].split('/')
		else
			numeroProcesso_e_ano_array = numero_do_processo_e_ano.split('-')[1].split('/')
		end
		numeroProcesso_e_ano_array[0] = numeroProcesso_e_ano_array[0][1..-1]
		while numeroProcesso_e_ano_array[0].length < 5
			numeroProcesso_e_ano_array[0] = '0' + numeroProcesso_e_ano_array[0]
		end
		ano_do_processo = numeroProcesso_e_ano_array[1].split(' ')
		numeroProcesso_e_ano_array[1] = '20' + ano_do_processo[0]
		if numeroProcesso_e_ano_array[1].include?('\'')
			numeroProcesso_e_ano_array[1] = '2000'
		end
		numeroProcesso_e_ano_array
	end

	#O metodo não salva, apenas imprime na tela as informações de projeto coletadas, um dia ira salvar no banco
	def salva_dados_do_projeto (link_do_projeto)
		@html_do_projeto = Nokogiri::HTML(open(link_do_projeto.to_s))
		abrir_link_de_ordenacao_lista_de_presencas_do_projeto

		puts @nome_do_projeto = @html_do_projeto.css('div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
		@tipodevoto = ''
		indice_do_tipo_de_voto_na_pagina = 0
		while @html_da_lista_do_projeto.css('table.list tr td:nth-child(3)')[indice_do_tipo_de_voto_na_pagina] != nil

	   		@tipodevoto = @html_da_lista_do_projeto.css('table.list tr td:nth-child(3)')[indice_do_tipo_de_voto_na_pagina].text
	   		if "Sim" == @tipodevoto
	   			puts "Sim"
	   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
	   		elsif "Ausente" == @tipodevoto
	   			puts "Ausente"
	   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
	   		elsif @tipodevoto.include? "Absten"
	   			puts "Abstencao"
	   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
	   		elsif @tipodevoto.include? "Representa"
	   			puts "Representacao externa"
	   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
			elsif @tipodevoto.include? "N"
	   			puts "Nao votou"
	   			puts @html_da_lista_do_projeto.css('table.list tr td:nth-child(1)')[indice_do_tipo_de_voto_na_pagina].text
	   		end

	   		puts '----------------------------------------------------------------'

	   		indice_do_tipo_de_voto_na_pagina +=1
	   	end

  		abrir_o_link_de_detalhes_do_projeto

   		puts @ementa_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[4].text
		puts @status_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[6].text
		puts @autor_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[3].text
		puts @data_de_abertura_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[2].text
		puts @data_de_ultima_tramitacao_do_projeto = @html_detalhes_do_projeto.css('table.attributes tr td')[8].text
	end

	def executa_todo_o_script
		busca_de_dados = LeitorDeProjetosCamara.new
		contador_de_sessoes = 1
		link_das_sessoes = busca_de_dados.buscar_link_das_sessoes
		link_das_sessoes.each do |link_da_sessao|

		  link_dos_projetos = busca_de_dados.pegar_links_dos_projetos_da_sessao(link_da_sessao)
		  link_dos_projetos.each do |link_do_projeto|
		  	busca_de_dados.salva_dados_do_projeto(link_do_projeto)
		  end
		  contador_de_sessoes += 1
		end
	end
end

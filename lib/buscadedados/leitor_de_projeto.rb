require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mongo_mapper'
require 'ostruct'

class LeitorDeProjeto

  @nome_do_projeto
  @data_tramitacao
  @ementa
  @autores
  @votos
  @situacao
  @data_abertura
  @link_pdf
  @projeto

  def initialize (detalhe_projeto)
    @projeto = Nokogiri::HTML(open(detalhe_projeto))
  end

  def retorna_nome_do_projeto (pagina_do_projeto)
    @pagina_do_projeto = Nokogiri::HTML(open(pagina_do_projeto))
    @nome_do_projeto = @pagina_do_projeto.css('div#content div.box.no-box b')[0].text.split(' ')[1..-1].join(' ')
  end

  def retorna_data_de_tramitacao_do_projeto
    @data_tramitacao = @projeto.css('table.attributes tbody tr:last-child td').text
  end

  def retorna_a_ementa_do_projeto
    @ementa = @projeto.css('table.attributes tbody tr:nth-child(5) td').text
  end

  def retorna_os_autores_da_pagina
    @autores = @projeto.css('table.attributes tbody tr:nth-child(4) td').text
  end

  def retorna_a_situacao_do_projeto
    @situacao = @projeto.css('table.attributes tbody tr:nth-child(7) td').text
  end

  def retorna_a_data_de_abertura_do_projeto
    @data_abertura = @projeto.css('table.attributes tbody tr:nth-child(3) td').text
  end

  def retorna_o_link_do_pdf_do_projeto
    link = @projeto.css('div#documentos ul li a.projeto_detalhe')[0].attr("onclick").to_s
    comeca_com = "http"
      if link.include? ".pdf"
        termina_com = ".pdf"
      else
        termina_com = ".doc"
    end
      inicio = link.index(comeca_com)
      tamanho_link = link.index(termina_com, inicio) - inicio + 4
      @link_pdf = link[inicio,tamanho_link]
  end

end
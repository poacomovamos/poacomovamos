require 'rubygems'
require 'nokogiri'
require 'open-uri'

class LeitorDeSessao
  
  def initialize(link_da_sessao)
    @html_da_sessao = Nokogiri::HTML(open(link_da_sessao))
    @lista_de_sessoes = []
  end

  def e_projeto?(projeto)
    projeto.include?('PROC')
  end

  def pega_lista_de_projetos
    @variavel = @html_da_sessao.css('table.list tbody  tr td:nth-child(2) span.detalhe a')
    indice = 0
    while @variavel[indice] != nil 
      if e_projeto?(@variavel[indice].text)
        @lista_de_sessoes << @variavel[indice].attr('href')
      end
      indice += 1
    end
    @lista_de_sessoes
  end

end
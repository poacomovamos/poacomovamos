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
    na_posicao = 0
    while @variavel[na_posicao] != nil 
      if e_projeto?(@variavel[na_posicao].text)
        @lista_de_sessoes << @variavel[na_posicao].attr('href')
      end
      na_posicao += 1
    end
    @lista_de_sessoes
  end

end
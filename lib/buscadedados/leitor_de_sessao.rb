require 'rubygems'
require 'nokogiri'
require 'open-uri'

class LeitorDeSessao
  
  def initialize(link_da_sessao)
    @html_da_sessao = Nokogiri::HTML(open(link_da_sessao))
    @lista_de_links_de_projetos = []
  end

  def pega_links_dos_projetos(projetos_da_sessao)
    na_posicao = 0
    while projetos_da_sessao[na_posicao] != nil 
      if e_projeto?(projetos_da_sessao[na_posicao].text)
        popula_lista_de_links_de_projetos(projetos_da_sessao[na_posicao].attr('href'))
      end
      na_posicao += 1
    end
  end

  def pega_lista_de_projetos
    projetos_da_sessao = @html_da_sessao.css('table.list tbody  tr td:nth-child(2) span.detalhe a')
    pega_links_dos_projetos(projetos_da_sessao)
  end

  def e_projeto?(projeto)
    projeto.include?('PROC')
  end

  def pega_lista_de_links_de_projetos
    pega_lista_de_projetos
    @lista_de_links_de_projetos
  end

  private
  def popula_lista_de_links_de_projetos link_de_projeto
    @lista_de_links_de_projetos << link_de_projeto
  end


end
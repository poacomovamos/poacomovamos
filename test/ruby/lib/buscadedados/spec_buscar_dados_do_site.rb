require './environment'
require_relative '../../../../lib/buscadedados/buscar_dados_do_site'

describe BuscarDadosDoSiteDaCamara do

  it 'pega uma lista de paginas' do
    @baseUrl = FakeBasePage.new
    @url = 'lista_de_sessoes.html'
    @busca_de_dados = BuscarDadosDoSiteDaCamara.new(@baseUrl, @url)

    @busca_de_dados.lista_de_paginas
    .should eq(['test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes.html',
      'test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes2.html',
      'test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes3.html'])
  end

  it 'pega todos links de sessão percorrendo todas as urls' do
    @baseUrl = FakeBasePage.new
    @url = 'lista_de_sessoes.html'
    @buscador_de_dados = BuscarDadosDoSiteDaCamara.new(@baseUrl, @url)

    @buscador_de_dados.pega_todos_os_links_das_sessoes
    .should eq(['sessoes/sessao119/index.html', 'sessoes/sessao14/index.html',
      'sessoes/sessao13/index.html', 'sessoes/sessao12/index.html',
      'sessoes/sessao11/index.html', 'sessoes/sessao10/index.html',
      'sessoes/sessao09/index.html', 'sessoes/sessao08/index.html',
      'sessoes/sessao07/index.html', 'sessoes/sessao06/index.html',
      'sessoes/sessao05/index.html', 'sessoes/sessao04/index.html',
      'sessoes/sessao03/index.html', 'sessoes/sessao02/index.html',
      'sessoes/sessao01/index.html'])
  end

end

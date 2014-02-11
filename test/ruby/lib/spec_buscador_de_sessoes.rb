require './environment'
require_relative '../../../lib/buscador_de_sessoes'

describe BuscadorDeSessoes do

  before(:all) do
    @baseUrl = FakeBasePage.new
    @link = 'test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes.html'
    @buscador_de_sessoes = BuscadorDeSessoes.new(@link, @baseUrl)

  end 

  it 'verifica se a sessão é do mandato corrente' do
    @buscador_de_sessoes.a_sessao_e_do_mandato_corrente?('3ª Sessão Ordinária - de 06 de fevereiro de 2014')
    .should be(true)
  end

  it 'pega a proxima página' do
    @buscador_de_sessoes.proxima_pagina
    .should eq('test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes2.html')
  end

  it 'pega todos os links de sessao de uma url' do
    @buscador_de_sessoes.pega_todos_os_links_da_pagina
    .should be(['sessoes/sessao119/index.html',
      'sessoes/sessao14/index.html',
      'sessoes/sessao13/index.html',
      'sessoes/sessao12/index.html',
      'sessoes/sessao11/index.html'])
  end

=begin
  it 'pega todos links de sessão percorrendo todas as urls' do
    @buscador_de_sessoes.pega_todos_os_links_da_pagina
    .should eq(['sessoes/sessao119/index.html', 'sessoes/sessao14/index.html',
      'sessoes/sessao13/index.html', 'sessoes/sessao12/index.html',
      'sessoes/sessao11/index.html', 'sessoes/sessao10/index.html',
      'sessoes/sessao09/index.html', 'sessoes/sessao08/index.html',
      'sessoes/sessao07/index.html', 'sessoes/sessao06/index.html',
      'sessoes/sessao05/index.html', 'sessoes/sessao04/index.html',
      'sessoes/sessao03/index.html', 'sessoes/sessao02/index.html',
      'sessoes/sessao01/index.html'])
  end
=end

end
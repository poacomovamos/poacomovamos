require './environment'
require_relative '../../../../lib/buscadedados/leitor_de_pagina'
require_relative 'fake_base_page'

describe BuscadorDeSessao do

  before(:all) do
    @baseUrl = FakeBasePage.new
    @link = 'test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes.html'
    @buscador_de_sessoes = BuscadorDeSessao.new(@link, @baseUrl)

  end

  it 'verifica se a sessão é do mandato corrente' do
    @buscador_de_sessoes.a_sessao_e_do_mandato_corrente?('3ª Sessão Ordinária - de 06 de fevereiro de 2014')
    .should be(true)
  end

  it 'pega a pagina corrente' do
    @buscador_de_sessoes.link_da_pagina
    .should eq('test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes.html')
  end

  it 'pega a proxima página' do
    @buscador_de_sessoes.link_proxima_pagina
    .should eq('test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes2.html')
  end

  it 'pega a proxima pagina, da proxima pagina' do
    link_proxima_pagina = @buscador_de_sessoes.link_proxima_pagina
    @buscador_de_sessoes = BuscadorDeSessao.new(link_proxima_pagina, @baseUrl)

    @buscador_de_sessoes.link_proxima_pagina
    .should eq('test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes3.html')
  end

  it 'pega todos os links de sessao de uma url' do
    @buscador_de_sessoes.pega_todos_os_links_da_pagina
    .should eq(['sessoes/sessao119/index.html',
      'sessoes/sessao14/index.html',
      'sessoes/sessao13/index.html',
      'sessoes/sessao12/index.html',
      'sessoes/sessao11/index.html'])
  end

end
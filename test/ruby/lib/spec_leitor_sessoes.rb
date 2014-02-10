require './environment'
require_relative '../../../lib/leitor_de_sessoes'

describe LeitorDeSessao do

  before(:all) do
    @link_da_sessao = 'test/ruby/lib/mocks/leitor_presenca_sessao/sessoes/sessao119/index.html'
    @leitor_de_sessao = LeitorDeSessao.new(@link_da_sessao)
  end 

  it 'deve verificar se é um projeto' do
    @leitor_de_sessao.e_projeto?('PLL 157/13 - PROC. 1587/13')
    .should be(true)

    @leitor_de_sessao.e_projeto?('PLL 157/13 - Avocado. 1587/13')
    .should be(false)

  end

  it 'deve retorar uma lista de projetos' do
    @leitor_de_sessao.pega_lista_de_projetos
    .should eq(['projeto197/projeto197.html', 
      'projeto157/projeto157.html', 
      'http://votacoes.camarapoa.rs.gov.br/parlamentares?data=04%2F12%2F2013+00%3A00%3A00&sessao=119&tiposessao=O&tipovotacao=N&votacao=N204'])
  end

end
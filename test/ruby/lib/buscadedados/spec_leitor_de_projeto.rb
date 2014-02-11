require './environment'
require_relative '../../../../lib/buscadedados/leitor_de_projeto'

describe LeitorDeProjeto do

  before(:all) do
    @pagina_do_projeto = 'test/ruby/lib/mocks/leitor_presenca_sessao/sessoes/sessao119/projeto157/projeto157detalhes.html'
    @leitor_de_projetos = LeitorDeProjeto.new(@pagina_do_projeto)
  end

  it 'retorna o nome do projeto' do
    @leitor_de_projetos.retorna_nome_do_projeto('test/ruby/lib/mocks/leitor_presenca_sessao/sessoes/sessao119/projeto157/projeto157ordenado.html')
    .should eq('PLL 157/13 - PROC. 1587/13')
  end

  it 'retorna a data de tramitação do projeto' do
    @leitor_de_projetos.retorna_data_de_tramitacao_do_projeto
    .should eq('26/12/2013')
  end

  it 'retorna a ementa da pagina' do
    @leitor_de_projetos.retorna_a_ementa_do_projeto
    .should eq('CONCEDE O TITULO DE CIDADA EMERITA DE PORTO ALEGRE A SENHORA GENY PINTO MACHADO.')
  end

  it 'retorna os autores da paginas' do
    @leitor_de_projetos.retorna_os_autores_da_pagina
    .should eq('PAULINHO MOTORISTA')
  end

  it 'retorna a situação do projeto' do
    @leitor_de_projetos.retorna_a_situacao_do_projeto
    .should eq('APROVADO')
  end

  it 'retorna a data de abertura do projeto' do
    @leitor_de_projetos.retorna_a_data_de_abertura_do_projeto
    .should eq('06/05/2013')
  end

  it 'retorna o link do pdf do projeto' do
    @leitor_de_projetos.retorna_o_link_do_pdf_do_projeto
    .should eq('http://200.169.19.94/processo_eletronico/015872013PLL/015872013PLL_PROJETO_50910324_1339.pdf')
  end

end

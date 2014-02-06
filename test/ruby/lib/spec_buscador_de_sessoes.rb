require './environment'
require_relative '../../../lib/buscador_de_sessoes'

describe BuscadorDeSessoes do

  before(:all) do
    @link = 'test/ruby/lib/mocks/leitor_presenca_sessao/lista_de_sessoes.html'
    @buscador_de_sessoes = BuscadorDeSessoes.new(@link)
  end 

  it 'verifica se a sessão é do mandato corrente' do
    @buscador_de_sessoes.a_sessao_e_do_mandato_corrente?('3ª Sessão Ordinária - de 06 de fevereiro de 2014')
    .should be(true)
  end

  it '' do
  end

end
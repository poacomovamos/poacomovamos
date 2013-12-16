require 'rubygems'
require "test/unit"
require 'mongo_mapper'
require './environment'
require_relative '../../../models/vereador.rb'
require_relative '../../../models/projeto.rb'

class TestMain < Test::Unit::TestCase

  def test_se_retorna_um_vereador
    assert_not_nil(Vereador)
  end

  def test_se_vereador_tem_propriedade_email
    assert_equal("bernardino@camarapoa.rs.gov.br", Vereador.first(:email => "bernardino@camarapoa.rs.gov.br").email)
  end

  def test_se_vereador_tem_votos_em_projetos
  #assert_not_nil(Projeto.find("52aaf15f022884a015c8de90"))
  assert_equal("Autor", Projeto.first(:autor => "Autor").autor)

  end

end

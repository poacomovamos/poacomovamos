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
      v1 = Voto.create(:id_vereador => 'id', :tipo_voto => 'tipo')
      v2 = Voto.create(:id_vereador => 'id', :tipo_voto => 'tipo')
      v3 = Voto.create(:id_vereador => 'id', :tipo_voto => 'tipo')


      p = Projeto.new(
          :nome_projeto => "Projeto1",
          :ementa => "ementa",
          :status => "status",
          :autor => "autor",
          :votos => [{}
          ]
      )


    # p = Projeto.new(
    #     :nome_projeto => "Projeto1",
    #     :ementa => "ementa"
    #   ).save


    #assert_not_nil(Projeto.find("52aaf15f022884a015c8de90"))
    #assert_equal("autor", Projeto.first(:autor => "autor").autor)
  end

  # def test_se_voto_em_projetos
  #   assert_not_nil(Projeto.first(:votos => "a").votos)
  # end


end

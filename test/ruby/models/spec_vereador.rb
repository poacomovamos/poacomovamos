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
        v1 = Voto.new(:id_vereador => 'id1', :tipo_voto => 'sim')
        v2 = Voto.new(:id_vereador => 'id2', :tipo_voto => 'sim')
        v3 = Voto.new(:id_vereador => 'id3', :tipo_voto => 'nao')

        p = Projeto.new(
        :nome_projeto => "Projeto1",
        :ementa => "ementa",
        :status => "status",
        :autor => "autor",
        :votos => [v1,v2,v3]
        )


        assert_not_nil(p)
        assert_equal("autor", p.autor)
        assert_equal("sim", p.votos.first(:id_vereador => "id1").tipo_voto)
    end
end

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
        v = Vereador.new(
            :nome => "Vereador1",
            :partido => "PT",
            :email => "bernardino@camarapoa.rs.gov.br",
            :telefone => "999915847",
            :twitter => "@twitter",
            :facebook => "www.facebook.com.br/fulaninho",
            :foto => "fulaninho.jpg",
            :presente_ultima_sessao => true
        )
        assert_equal("bernardino@camarapoa.rs.gov.br", v.email)
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

    # def test_tem_sim_em_um_projeto_com_dados_fakes
    #     p = Projeto.create(
    #         :nome_projeto => "Projeto1",
    #         :ementa_projeto => "ementa",
    #         :status_projeto => "status",
    #         :autor_projeto => "autor",
    #         :data_abertura_projeto => "12/03/2010",
    #         :data_ultima_tramitacao_projeto => "25/12/2013",
    #         :votos => [
    #             Voto.new(:id_vereador => 'id1', :tipo_voto => 'sim'),
    #             Voto.new(:id_vereador => 'id2', :tipo_voto => 'nao'),
    #             Voto.new(:id_vereador => 'id3', :tipo_voto => 'nao'),
    #         ]
    #     ).save

    #     assert_equal("sim", Projeto.first(:nome_projeto => "Projeto1").votos.first(:tipo_voto => "sim").tipo_voto)
    # end

    # def test_tem_1_sim_no_Projeto1_fake
    #     assert_equal(1, Projeto.first(:nome_projeto => "Projeto1").votos.all(:tipo_voto => "sim").count)
    # end

    # def test_tem_2_nao_no_Projeto1_fake
    #     assert_equal(2, Projeto.first(:nome_projeto => "Projeto1").votos.all(:tipo_voto => "nao").count)
    # end

    # def test_tem_votos_em_projetos
    #     assert_equal(2, Projeto.first(:nome_projeto => "Projeto1").votos.all(:tipo_voto => "nao").count)
    # end

end

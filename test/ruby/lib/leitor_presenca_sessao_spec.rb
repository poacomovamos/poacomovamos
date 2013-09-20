require './environment'

describe LeitorPresencaEmSessao do
  let (:resultado_votacao_page) { open('./test/ruby/lib/fixtures/resultado_votacao_mocked_page.html').read }
  let (:informacao_presenca_extraida_do_site_da_camara) {
    [{
      sessao: 64,
      votacao: 'P124',
      parlamentar: 'Airto Ferronato',
      presenca: true
    },
    {
      sessao: 64,
      votacao: 'P124',
      parlamentar: 'Outro vereador',
      presenca: true
    }]
  }

  before(:each) do
    @mongo_entity = [double('Presenca').as_null_object, double('Presenca').as_null_object]

    allow(LeitorPresencaEmSessao).to receive(:open).and_return resultado_votacao_page
  end

  it "extrai do site da camara, informacao de presenca dos parlamentares em sessoes da camara" do
    expect(Presenca).to receive(:new).with(informacao_presenca_extraida_do_site_da_camara[0]).and_return @mongo_entity[0]
    expect(@mongo_entity[0].to receive(:save))

    expect(Presenca).to receive(:new).with(informacao_presenca_extraida_do_site_da_camara[1]).and_return @mongo_entity[1]
    expect(@mongo_entity[1].to receive(:save))

    LeitorPresencaEmSessao.puxar_presenca_votacao(Time.now, 64, 'O', 'P124', 'P')
  end
end

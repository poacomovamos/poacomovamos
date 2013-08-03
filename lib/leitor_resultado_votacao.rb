# encoding: utf-8

require 'open-uri'
require 'formatador'
require 'nokogiri'

class LeitorPresencaEmSessoes

  def self.puxar_presencas(data, sessao, tipo_sessao, votacao, tipo_votacao)
    url = "http://votacoes.camarapoa.rs.gov.br/parlamentares_nome?data=#{data}&sessao=#{sessao}&tiposessao=#{tipo_sessao}&tipovotacao=#{tipo_votacao}&votacao=#{votacao}"
    doc = Nokogiri::HTML(open(url))
    presencas = doc.css('.list tr:not(:first-of-type)')

    presencas.each do |presenca|
      informacao_presenca = presenca.css('td')
      nome_parlamentar = informacao_presenca[0].text
      presente = informacao_presenca[2].text != 'Ausente'
      Presenca.create({
        sessao: sessao,
        votacao: votacao,
        parlamentar: nome_parlamentar,
        presenca: presente
      }).save
    end
  end
end

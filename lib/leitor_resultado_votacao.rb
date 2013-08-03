# encoding: utf-8

require 'open-uri'
require 'formatador'
require 'nokogiri'

class LeitorResultadoVotacao

  def self.puxar_resultado(data, sessao, tipo_sessao, votacao, tipo_votacao)
    url = "http://votacoes.camarapoa.rs.gov.br/parlamentares_nome?data=#{data}&sessao=#{sessao}&tiposessao=#{tipo_sessao}&tipovotacao=#{tipo_votacao}&votacao=#{votacao}"
    doc = Nokogiri::HTML(open(url))
    tabela_votacao = doc.css('.list tr')
    tabela_votacao.shift
    tabela_votacao.each do |parlamentar|
      nome = parlamentar.css('td')[0].text
      presente = parlamentar.css('td')[2].text != 'Ausente'
      puts Presenca.create({
        sessao: sessao,
        votacao: votacao,
        parlamentar: nome,
        presenca: presente
      }).save
    end
  end
end

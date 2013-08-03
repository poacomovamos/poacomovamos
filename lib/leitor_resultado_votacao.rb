# encoding: utf-8

require 'open-uri'
require 'formatador'
require 'nokogiri'

class LeitorResultadoVotacao
  def self.puxar_presencas
    Sessao.all.each do |sessao|
      url = URI( URI::encode("http://votacoes.camarapoa.rs.gov.br/votacoes?data=#{sessao.data.strftime("%d/%m/%Y %H:%M:%S")}&numero=#{sessao.numero}&tiposessao=#{sessao.tipo}"))
      doc = Nokogiri::HTML(open(url))
      doc.css('.list td:nth-child(5) a').each do |link_votacao|

        link = link_votacao.attribute('href').value
        votacao = /&votacao=(.*)$/.match(URI::unescape(link))[1]
        tipo_votacao = /tipovotacao=(.*)&/.match(link)[1]

        puxar_presenca_votacao(sessao.data, sessao.numero, sessao.tipo, votacao, tipo_votacao)
      end
    end
  end

  def self.puxar_presenca_votacao(data, sessao, tipo_sessao, votacao, tipo_votacao)
    url = URI(URI::encode("http://votacoes.camarapoa.rs.gov.br/parlamentares_nome?data=#{data.strftime("%d/%m/%Y %H:%M:%S")}&sessao=#{sessao}&tiposessao=#{tipo_sessao}&tipovotacao=#{tipo_votacao}&votacao=#{votacao}"))
    doc = Nokogiri::HTML(open(url))
    presencas = doc.css('.list tr:not(:first-of-type)')

    puts "Salvando sessao: #{sessao}, votacao: #{votacao}"
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

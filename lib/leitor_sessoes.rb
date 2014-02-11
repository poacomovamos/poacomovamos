require 'open-uri'
require 'formatador'
require 'nokogiri'

class LeitorSessoes
  @sessoes = []

  def self.obter_sessoes (sessoes_da_pagina, sessao_mais_recente)
    sessoes_da_pagina.each do |html_sessao|
      link = URI::unescape(html_sessao.attribute('href').value)

      sessao = Sessao.new(
        :numero => /numero=(.*)&/.match(link)[1],
        :tipo => /tiposessao=(.*)$/.match(link)[1],
        :data => Date.strptime(/data=\d+\/\d+\/\d+/.match(link)[0], 'data=%d/%m/%Y')
      )

      if (sessao_mais_recente == nil or !(sessao.numero == sessao_mais_recente.numero and sessao.tipo == sessao_mais_recente.tipo and sessao.data == sessao_mais_recente.data))
        @sessoes << sessao
      else
        Formatador.display_line "Sessão '#{sessao.tipo}/#{sessao.numero}' já existente"
        return true
      end
    end

    return false
  end

  def self.puxar_sessoes
    sessao_mais_recente = Sessao.last(:order => :_id.asc)

    doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/"))
    paginas = doc.css(".pagination").first.css("a")

    # Ignorando ultimo elemento 'a' 'Proxima Pagina'
    ultima_pagina = paginas[paginas.size - 2].text.to_i

    (1..ultima_pagina).each do |pagina|
      Formatador.display_line "Sessões da pagina #{pagina}"

      doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/?page=#{pagina}"))

      if obter_sessoes(doc.css(".sessoes"), sessao_mais_recente)
        break
      end

    end

    @sessoes.reverse_each do |sessao|
      begin
        sessao.save!
        LeitorPresencaEmSessao.puxar_presencas sessao
        Formatador.display_line "salvou sessão #{sessao.inspect}"
      rescue => exception
        Formatador.display_line "[red][bold]problema salvando sessão #{sessao.inspect}: #{exception}[/]"
        break
      end
    end
  end

  def self.salva_sessao (html_sessao)
    begin
      link = URI::unescape(html_sessao.attribute('href').value)

      s = Sessao.new(
        :numero => /numero=(.*)&/.match(link)[1],
        :tipo => /tiposessao=(.*)$/.match(link)[1],
        :data => Date.strptime(/data=\d+\/\d+\/\d+/.match(link)[0], 'data=%d/%m/%Y')
      )
      s.save!

      Formatador.display_line "salvou sessão #{s.inspect}"
    rescue => exception
      Formatador.display_line "[red][bold]problema salvando sessão #{html_sessao}: #{exception}[/]"
    end
  end

end
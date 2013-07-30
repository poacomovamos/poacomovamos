require 'open-uri'
require 'formatador'
require 'nokogiri'

class LeitorSessoes

  def self.puxar_sessoes
    (1...17).each do |pagina|
      
      begin
        doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/?page=#{pagina}"))
        doc.css(".sessoes").each do |html_sessao|
          salva_sessao html_sessao
        end
        Formatador.display_line "[bold]terminou de salvar página #{pagina}[/]"
      rescue => exception
        Formatador.display_line "[red][bold]página #{pagina} falhou: #{exception}[/]"
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

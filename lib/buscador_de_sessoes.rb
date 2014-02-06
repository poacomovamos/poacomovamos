require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BuscadorDeSessoes

  def initialize(baseURL)
    @html_base = Nokogiri::HTML(open(baseURL))
  end

  def a_sessao_e_do_mandato_corrente?(sessao)
    ano = @html_base.css('div.box.no-box p a.sessoes')[0].text.split(" ")[-1].to_i
    if ano >= 2013 and ano <= 2016
       return true
     else
      return false
    end
  end

end
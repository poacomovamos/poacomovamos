require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BuscadorDeSessoes

  @pagina_atual

  def initialize(pagina_principal, base_url)
    @base_url = base_url
    @html_base = Nokogiri::HTML(open(pagina_principal))
  end

  def a_sessao_e_do_mandato_corrente?(sessao)
    ano = @html_base.css('div.box.no-box p a.sessoes')[0].text.split(" ")[-1].to_i
    
    ano >= 2013 and ano <= 2016
  end

  def pega_pagina_corrente
    @pagina_atual = @html_base.css('div.box.no-box div.pagination span.current').text.to_i
    @pagina_atual.class
  end

  def pega_a_proxima_pagina
    @proxima_pagina = @html_base.css('div.box.no-box div.pagination a')[-1]
    if @proxima_pagina != nil
      @base_url.pega_base_page << @proxima_pagina.attr('href')
    end
  end

  def pega_todos_os_links_de_todas_pagias
    while pega_a_proxima_pagina
      todos_links << pega_todos_os_links
    end
  end

  def pega_todos_os_links
   
  end


end
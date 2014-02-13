require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BuscadorDeSessao

  def initialize(pagina_principal, base_url)
    @base_url = base_url
    @pagina = pagina_principal
    @html_base = Nokogiri::HTML(open(pagina_principal))
    @todas_sessoes = Array.new
  end

  def a_sessao_e_do_mandato_corrente?(sessao)
    ano = @html_base.css('div.box.no-box p a.sessoes')[0].text.split(" ")[-1].to_i
    ano >= 2013 and ano <= 2016
  end

  def link_da_pagina
    @pagina
  end

  def proxima_pagina
    @proxima_pagina = @html_base.css('div.box.no-box div.pagination a.next_page')[-1]
  end

  def link_proxima_pagina
    @proximo_link_html = nil
    if proxima_pagina != nil
      @proximo_link_html = @base_url.pega_base_page << @proxima_pagina.attr('href')
    end
    @proximo_link_html
  end

  def pega_todos_os_links_da_pagina
    @html_base.css('div.box.no-box p a.sessoes').each do |sessao|
      @todas_sessoes << sessao.attr('href')
    end
    @todas_sessoes
  end

end
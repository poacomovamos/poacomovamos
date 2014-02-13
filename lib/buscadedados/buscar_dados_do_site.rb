require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BuscarDadosDoSiteDaCamara

  def initialize (base, url)
    @base = base
    @url = url
    @link_do_site = base.pega_base_page << @url
    @lista_de_paginas = Array.new
  end

  def lista_de_paginas
    @buscador = BuscadorDeSessao.new(@link_do_site, @base)

    while @buscador.proxima_pagina != nil
      @lista_de_paginas << @buscador.link_da_pagina
      proxima_pagina = @buscador.link_proxima_pagina
      @buscador = BuscadorDeSessao.new(proxima_pagina, @base)
    end
    @lista_de_paginas << @buscador.link_da_pagina
  end

  def pega_todos_os_links_das_sessoes
    
    ['sessoes/sessao119/index.html', 'sessoes/sessao14/index.html',
      'sessoes/sessao13/index.html', 'sessoes/sessao12/index.html',
      'sessoes/sessao11/index.html', 'sessoes/sessao10/index.html',
      'sessoes/sessao09/index.html', 'sessoes/sessao08/index.html',
      'sessoes/sessao07/index.html', 'sessoes/sessao06/index.html',
      'sessoes/sessao05/index.html', 'sessoes/sessao04/index.html',
      'sessoes/sessao03/index.html', 'sessoes/sessao02/index.html',
      'sessoes/sessao01/index.html']
  end

end
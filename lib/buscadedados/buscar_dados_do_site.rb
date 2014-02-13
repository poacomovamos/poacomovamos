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

end
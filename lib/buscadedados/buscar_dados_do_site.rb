require 'rubygems'
require 'nokogiri'
require 'open-uri'

class BuscarDadosDoSiteDaCamara

  def initialize(link_do_site)
    html_do_site = Nokogiri::HTML(open(link_do_site))
  end

  def pega

  end

end
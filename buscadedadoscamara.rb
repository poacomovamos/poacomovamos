require 'rubygems'
require 'nokogiri'
require 'open-uri'
#require_relative 'vereador'

class Buscadedados
	def initialize
		@link = Nokogiri::HTML(open('http://votacoes.camarapoa.rs.gov.br/votacoes'))
	end

	def primeiro_link
		@link_do_projeto = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/" + @link.css('a.sessoes')[0].attr("href")))
	end

	def primeiro_link_segunda_camada
		@link_do_projeto
	end

end	

#bd = Buscadedados.new 

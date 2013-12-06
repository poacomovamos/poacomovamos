require 'rubygems'
require 'open-uri'
require "test/unit"
require_relative 'buscadedadoscamara'

class TestMain < Test::Unit::TestCase

	def setup
		@site = Buscadedados.new
	end

	def testa_primeiro_link
		assert_equal("/votacoes?data=05%2F12%2F2013+00%3A00%3A00&numero=120&tiposessao=O", @site.primeiro_link)
	end


end

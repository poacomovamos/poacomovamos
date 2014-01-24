require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mongo_mapper'
require 'ostruct'

class LeitorDeProjetos

  def initialize
    @a = 1;
    @sessoes = 5;
  end
  
  def sessoes
    @sessoes
  end

end
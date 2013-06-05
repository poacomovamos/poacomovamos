require 'open-uri'
require_relative '../../app/helpers/session_scrapper_helper'
require_relative '../../app/models/session'

desc 'scrap sessions (ALL)'
task :scrap_sessions do
  (1...17).each do |page|
    doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/?page=#{page}"))
    doc.css(".sessoes").each do |session|
      link = session.attribute('href').value
      s = Session.new(SessionScrapperHelper.parse link)
      puts s.number
    end
  end
end
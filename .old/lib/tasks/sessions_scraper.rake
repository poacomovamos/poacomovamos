require 'open-uri'
require 'formatador'
require_relative '../../app/helpers/session_scraper_helper'
require_relative '../../app/models/session'



desc 'scrapes sessions from the votacoes.camarapoa.rs.gov.br website'
task :scrape_sessions => :environment do
  (1...17).each do |page|
    begin
      doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/?page=#{page}"))
      
      doc.css(".sessoes").each do |session|
        begin
          link = URI::unescape(session.attribute('href').value)
          
          s = Session.new(SessionScraperHelper.parse link)
          s.save!
          Formatador.display_line "saved session with date #{s.date} and number #{s.number}"
        rescue => exception
          Formatador.display_line "[red][bold]problem saving session #{session}: #{exception}[/]"
        end
      end
      Formatador.display_line "[bold]finished saving page #{page}[/]"
    rescue => exception
      Formatador.display_line "[red][bold]page #{page} failed: #{exception}[/]"
    end
  end
end

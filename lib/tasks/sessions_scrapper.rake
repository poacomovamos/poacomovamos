require 'open-uri'

desc 'scrap sessions (ALL)'
task :scrap_sessions do
  (1...17).each do |page|
    doc = Nokogiri::HTML(open("http://votacoes.camarapoa.rs.gov.br/?page=#{page}"))
    doc.css(".sessoes").each do |sessao|
      debugger
      sessao
    end
  end
end



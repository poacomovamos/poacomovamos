require 'nokogiri'
require 'open-uri'

class ProjectScraper

  #projects_in_course_url = lambda { |page_number| "http://projetos.camarapoa.rs.gov.br/consultas/em_tramitacao?page=#{page_number}" }

  def fetch(url)
    OpenURI::OpenRead.open(url)
  end

  def process(html)
    doc = Nokogiri::HTML(html)
    doc.css('.even, .odd').map do |node|
      {
        number: node.css('td')[0].text.strip,
        year: node.css('td')[1].text.strip,
        type: node.css('td')[2].text.strip,
        materia: node.css('td')[3].text.strip,
        ementa: node.css('td')[4].text.strip,
        processingDate: node.css('td')[5].text.strip,
        sector: node.css('td')[6].text.strip,
        authors: node.css('td')[7].text.strip,
        status: node.css('td')[8].text.strip,
        veto: node.css('td')[9].text.strip
      }
    end
  end
end

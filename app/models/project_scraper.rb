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
      project_data = node.css('td')
      {
        number: project_data[0].text.strip,
        year: project_data[1].text.strip,
        type: project_data[2].text.strip,
        materia: project_data[3].text.strip,
        ementa: project_data[4].text.strip,
        processingDate: project_data[5].text.strip,
        sector: project_data[6].text.strip,
        authors: project_data[7].text.strip,
        status: project_data[8].text.strip,
        veto: project_data[9].text.strip
      }
    end
  end
end

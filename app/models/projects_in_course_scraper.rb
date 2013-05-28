require 'nokogiri'
require 'open-uri'

class ProjectsInCourseScraper

  projects_in_course_url = lambda { |page_number| "http://projetos.camarapoa.rs.gov.br/consultas/em_tramitacao?page=#{page_number}" }

  def process html
    doc = Nokogiri::HTML(html)
    doc.css('.even, .odd').map do |node|
      { number: node.css('td')[0].text }
    end
  end
end

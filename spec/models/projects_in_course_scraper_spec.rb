require 'spec_helper'
require 'open-uri'

describe ProjectsInCourseScraper do

  describe '#process' do
    it "extracts project's information from HTML as a Ruby hash" do
      html = open('spec/models/projects_in_course_page.html')
      projects = subject.process html

      projects.size.should eq 2

      projects[0].should match_project_in_course({
          number: "04078", 
          year: "2011", 
          type: "PLL", 
          materia: "242", 
          ementa: "inclui inc. iii no paragrafo unico do art. 42 da lei n. 6.310,  de  28  de dezembro de 1988 - que estabelece o plano de carreira dos funcionarios do departamento municipal de habitacao (demhab),  dispoe sobre o plano de pagamento e da outras providencias -, e alteracoes posteriores, incluindo excecao a proibicao de o funcionario convocado para o regime especial de dedicacao exclusiva exercer cumulativamente outro cargo, funcao ou atividade publica ou privada.",
          processingDate: "05/02/2013",
          sector: "cuthab - comissao de urban,transp e habitacao",
          authors: "reginaldo pujol",
          status: "para parecer",
          veto: ""
      })

      projects[1].should match_project_in_course({
          number: "01634", 
          year: "2012", 
          type: "PLE", 
          materia: "32", 
          ementa: "declara de utilidade publica o instituto urbis porto alegre - cidadania e participacao popular.",
          processingDate: "05/02/2013",
          sector: "cece - comissao de educacao cultura e esportes",
          authors: "governo municipal",
          status: "para parecer",
          veto: ""
      })
    end
  end
end

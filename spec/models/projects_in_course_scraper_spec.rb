require 'spec_helper'
require 'open-uri'

describe ProjectsInCourseScraper do
  
  describe '#process' do
    it "extracts project's information from HTML as a Ruby hash" do
      html = open('spec/models/projects_in_course_page.html')
      projects = subject.process html

      projects.should match_array([
        {
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
        },
        {
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
        },
        {
          number: "01978", 
          year: "2009", 
          type: "PLL", 
          materia: "81", 
          ementa: "inclui  art. 6-a na lei  n. 5.548, de 28 de dezembro de 1984 - que consolida dispositivos relativos a instituicao da passagem escolar no municipio de porto alegre e da outras providencias -, e alteracoes posteriores, possibilitando o uso dessa passagem em todos os dias da semana, inclusive e feriados.",
          processingDate: "05/02/2013",
          sector: "cefor - comissao de economia financas orcamento e",
          authors: "fernanda melchionna",
          status: "para parecer",
          veto: ""
        },
        {
          number: "00674", 
          year: "2009", 
          type: "PLL", 
          materia: "12", 
          ementa: "reserva 10% (dez por cento) das unidades de moradia e os apartamentos terreos as pessoas idosas e as pessoas com deficiencia contempladas como beneficiarias nos programas habitacionais populares implantados pelo executivo municipal, revoga a lei n. 10396, de 1 de abril de 2008, e da outras providencias.",
          processingDate: "06/02/2013",
          sector: "setor legislativo",
          authors: "waldir canal",
          status: "ordem do dia",
          veto: ""
        }
      ])
    end
  end
end

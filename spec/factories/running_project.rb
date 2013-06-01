require 'factory_girl'

FactoryGirl.define do
  factory :running_project do
    number 899
    year 2013
    type "PLL"
    materia 73
    ementa "inclui a efemeride dia da afirmacao negra no calendario de datas comemorativas e de conscientizacao do municipio de porto alegre - lei n. 10.904, de 31 de maio de 2010, e alteracoes posteriores -, no dia 14 de marco, e institui, na camara municipal de porto alegre, a comenda abdias do nascimento."
    processing_date DateTime.new(2013, 5, 27)
    sector "procuradoria"
    authors "delegado cleiton"
    status "para parecer"
    veto ""
  end
end

# Language: pt-br
Feature: Ontem na Camara 

  @pending
  Scenario: Listar todos os vereadores na página 
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    Quando eu acesso a página principal
    Então eu devo ver todos os vereadores listados

  @pending
  Scenario: Criar mecanismo para buscar relatório de presença
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    Quando que o horário estipulado para busca de presença foi alcançado
    Então temos que buscar a lista de presentes no relatório de comparecimento
    
  @pending
  Scenario: Separação de quem foi e quem não foi
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    E segundo o relatório de comparecimento os presentes foram "Gabriela Guerra" e "Guilherme Froes"
    Quando eu acesso a página principal
    Então eu devo ver o sinal de presença gráfico para "Gabriela Guerra" e "Guilherme Froes"
    E eu devo ver o sinal de não presença gráfico para "Camilo Ribeiro"
    
  @pending
  Scenario: Incluir Partido do vereador e dados com foto
    Dado que existem os vereadores "Gabriela Guerra" e "Camilo Ribeiro"
    E que os vereadores tem os seguintes dados:
      | Nome            | Partido | email          | telephone      | twitter         | Facebook       | foto   |
      | Camilo Ribeiro  | QA      | camilo@gov.com | 4233/4234/4235 | @camiloribeiro  | camiloribeiro  | xxx    |
      | Gabriela Guerra | BA      | gabi@gov.com   | 5233/5234/5235 | @gabrielaguerra | gabrielaguerra | yyy    |
    Quando eu acesso a página de 
    
  @pending
  Scenario: Adicionar percentual de presença desde o início de mandato
    
  @pending
  Scenario: conteúdo informacional sobre dados do card 
    
  @pending
  Scenario: Incluir coleta de feedback











// Vereador morreu
// não foi feito o uploade ou atualização dos dados de presença dos vereadores no horário estipulado

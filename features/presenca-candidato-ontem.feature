# language: pt
Funcionalidade: Ontem na Camara 

  @pending
  Cenário: Listar todos os vereadores na página de forma randômica
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    Quando eu acesso a página principal
    Então eu devo ver todos os vereadores listados de forma randômica

  @pending
  Cenário: Criar mecanismo para buscar relatório de presença
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    Quando que o horário estipulado para busca de presença foi alcançado
    Então temos que buscar a lista de presentes no relatório de comparecimento
    
  @pending
  Cenário: Separação de quem foi e quem não foi
    Dado que existem os vereadores "Gabriela Guerra", "Camilo Ribeiro" e "Guilherme Froes"
    E segundo o relatório de comparecimento os presentes foram "Gabriela Guerra" e "Guilherme Froes"
    Quando eu acesso a página principal
    Então eu devo ver o sinal de presença gráfico para "Gabriela Guerra" e "Guilherme Froes"
    E eu devo ver o sinal de não presença gráfico para "Camilo Ribeiro"

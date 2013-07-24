language: pt-br
Funcionalidade: Adicionando Informações do Candidato

@pending
  Cenário: Incluir Partido do vereador e dados com foto
    Dado que existem os vereadores "Gabriela Guerra" e "Camilo Ribeiro"
    E que os vereadores tem os seguintes dados:
      | Nome            | Partido | email          | telephone      | twitter         | Facebook       | foto   |
      | Camilo Ribeiro  | QA      | camilo@gov.com | 4233/4234/4235 | @camiloribeiro  | camiloribeiro  | xxx    |
      | Gabriela Guerra | BA      | gabi@gov.com   | 5233/5234/5235 | @gabrielaguerra | gabrielaguerra | yyy    |
    E que o prefixo telefone da camara é "3220"
    Quando eu acesso a página principal
    Então eu devo ver os vereadores com as seguintes informações:
      | Nome            | Partido | email          | telephone | twitter         | Facebook       | foto   |
      | Camilo Ribeiro  | QA      | camilo@gov.com | 3220-4233 | @camiloribeiro  | camiloribeiro  | xxx    |
      | Gabriela Guerra | BA      | gabi@gov.com   | 3220-5233 | @gabrielaguerra | gabrielaguerra | yyy    |
    E os seguintes dados devem ser clicáveis "twitter" e "facebook"
    
  @pending
  Cenário: Adicionar percentual de presença desde o início de mandato
    Dado que existem os vereadores "Gabriela Guerra"
    E que durante a semana abaixo ela teve presença nos seguintes dias:
      | Dia         | sessão | proposição   | presença |
      | 08/07/2013  | 60     | Chamada 1    | sim      |
      | 08/07/2013  | 60     | Chamada 2    | sim      |
      | 08/07/2013  | 60     | PL 530-A     | nao      |

      | 08/07/2013  | 5      | Chamada 1    | nao      |
      | 08/07/2013  | 5      | Chamada 2    | sim      |

      | 09/07/2013  | 60     | Chamada 1    | nao      |
      | 09/07/2013  | 60     | Chamada 2    | nao      |
      | 09/07/2013  | 60     | PL 530-B     | sim      |

      | 09/07/2013  | 6      | Chamada 1    | sim      |
      | 09/07/2013  | 6      | Chamada 2    | sim      |

      | 10/07/2013  | 61     | Chamada 1    | nao      |
      | 10/07/2013  | 61     | Chamada 2    | sim      |
      | 10/07/2013  | 61     | PL 543-A     | nao      |

      | 10/07/2013  | 7      | Chamada 1    | sim      |
      | 10/07/2013  | 7      | Chamada 2    | sim      |
      | 10/07/2013  | 7      | Chamada 3    | sim      |
      | 10/07/2013  | 7      | Req.233      | sim      |

    Quando eu acesso a página principal
    Então eu devo ver o percentual de presença como "55" 

    
  @pending
  Cenário: conteúdo informacional sobre dados do card 
    
  @pending
  Cenário: Incluir coleta de feedback

    # Vereador morreu
    # não foi feito o upload ou atualização dos dados de presença dos vereadores no horário estipulado

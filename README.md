[![Stories in Ready](https://badge.waffle.io/poacomovamos/poacomovamos.png?label=ready)](https://waffle.io/poacomovamos/poacomovamos)  
[<img src="https://travis-ci.org/poacomovamos/poacomovamos.png?branch=master" alt="Build Status" />](https://travis-ci.org/poacomovamos/poacomovamos)

## Bem-vindo ao Porto Alegre Como Vamos


O Porto Alegre Como Vamos é um movimento da sociedade civil, apartidário, sem fins lucrativos, que pretende trazer o cidadão a participar dos processos que acontecem na cidade, incidindo em políticas públicas e promovendo espaços de interação abertos para a melhoria da cidade. Temos como objetivo contribuir para fortalecimento da democracia e de qualidade de vida, mantendo um compromisso com o desenvolvimento sustentável e com a justiça social. Somos um organismo aberto, com o dever de acolher qualquer pessoa que com ele resolver interagir.

Em 2012 o movimento criou seu primeiro grande projetos na internet com o site "Voto Como Vamos", que proporcionava integração entre os candidatos a vereador da cidade de Porto Alegre com os eleitores através do portal votocomovamos.com.br, que também foi replicado para outras cidades no mesmo ano.


## Guide to Setup & Running

#### Pré requisitos:

* **[NPM ( Node Package Manager )](http://npmjs.org)**: NPM é o gerenciador de pacotes do node.js e ele é necessário para montar o setup de javascript. Pode ser instalado pelo [Homebrew](http://mxcl.github.io/homebrew/) ```brew install npm```

* Node Modules:
	* [Karma.js](http://karma-runner.github.io/0.8/index.html): Test runner utilizado para rodar os testes do javascript.
	A versão canary deve ser instalada ```npm install -g karma@canary```

* **[MongoDB](http://www.mongodb.org/)**: Mongo database ```brew install mongo```

* Bundler: Usado para gerenciar os pacotes ```gem install bundler```.
  - Instalando as dependencias linstadas no Gemfile: ```bundle install```

##### Rodando Testes

Digite ```rake test``` para rodar todos os testes ou ```rake jstest``` para rodar somente os de javascript

##### Rodando de App

Certifique-se de que o mongo esta rodando: ```mongod```

Com o mongo rodando, importe os dados da planilha de vereadores: ```rake importar_vereadores```

Digite e Divirta-se ```shotgun``` =)

#### Ambiente de produção no **[heroku](https://toolbelt.heroku.com/)**

- Dentro do diretório do projeto:```cd poacomovamos```

- ```heroku create nome_projeto```

- ```git push heroku master```

- ```heroku addons:add mongolab``` ou acessando **[MongoLab](https://addons.heroku.com/mongolab)**

- ```heroku run rake importar_vereadores```

Digite e Divirta-se ainda mais ```heroku open``` =)

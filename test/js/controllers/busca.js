"use strict";

describe('BuscaCtrl', function(){
  var scope, httpDouble, $controller;
  var vereadores = [
    {nome: 'antonio',     telefone: '00000000'}, 
    {nome: 'Cesar cezar', telefone: '00000000'}, 
    {nome: 'Any'}
  ];


  beforeEach(angular.mock.module("poaComoVamos"));
  
  beforeEach(angular.mock.inject(function($rootScope, _$controller_, $httpBackend){    
    $controller = _$controller_;

    scope = $rootScope.$new();

    httpDouble = $httpBackend;        
    httpDouble.when('GET', '/api/vereador').respond(vereadores);
    $controller('BuscaCtrl', {$scope: scope});

  }));

/* 
  it('deve chamar api assim que for inicializado', function(){
    var scope = {
      carregarVereadores: jasmine.createSpy('carregarVereadores')  
    }
    
    $controller('BuscaCtrl', {$scope: scope});

    expect( scope.carregarVereadores ).toHaveBeenCalled()
  })
*/
  it('#extrairNomes: deve retornar array vazio se receber null', function(){
    expect( scope.extrairNomes() ).toEqual( [] );
  })

  it('#extrairNomes: deve extrair os nomes dos vereadores', function(){      
    expect( scope.extrairNomes(vereadores) ).toEqual( ['antonio', 'Cesar cezar', 'Any'] );
  })

  it('#carregarVereadores: deve fazer um get em /api/vereador atraves do $http', function(){        
    httpDouble.expectGET('/api/vereador');
    scope.carregarVereadores();
    httpDouble.flush();
  })

  it('#carregarVereadores: deve extrair os nomes quando a api retorna com sucesso', function(){        
    scope.carregarVereadores();
    httpDouble.flush();

    expect( scope.nomes.length ).toBe(vereadores.length);
  });

})

/*
describe('Controller: busca,', function() {

  var scope, $httpBackend;
  var vereadores = [{nome : 'antonio', telefone: '00000000'}, {nome : 'Cesar cezar', telefone: '00000000'}, {nome : 'Any'}];

  beforeEach(angular.mock.module("poaComoVamos"));

  beforeEach(angular.mock.inject(function($rootScope, $controller, _$httpBackend_){

    $httpBackend = _$httpBackend_;
    $httpBackend.when('GET', '/api/vereador').respond([{nome : 'foo'}]);

    scope = $rootScope.$new(); 

    $controller('BuscaCtrl', {$scope: scope});
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('deve extrair um nome de uma lista', function(){
    scope.extrairNomes(vereadores);
    expect(scope.names[0]).toBe('antonio');
    $httpBackend.flush();
  });

  it('deve retornar a quantidade de nomes, igual ao numero de vereadores recebidos', function(){
    scope.extrairNomes(vereadores);
    expect(scope.names.length).toBe(vereadores.length);
    $httpBackend.flush();
  });

});
*/
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

  it('#extrairNomes: deve retornar array vazio se receber null', function(){
    expect( scope.extrairNomes() ).toEqual( [] );
  });

  it('#extrairNomes: deve extrair os nomes dos vereadores', function(){      
    expect( scope.extrairNomes(vereadores) ).toEqual( ['antonio', 'Cesar cezar', 'Any'] );
  });

  it('#carregarVereadores: deve fazer um get em /api/vereador atraves do $http', function(){        
    httpDouble.expectGET('/api/vereador');
    scope.carregarVereadores();
    httpDouble.flush();
  });

  it('#carregarVereadores: deve extrair os nomes quando a api retorna com sucesso', function(){        
    scope.carregarVereadores();
    httpDouble.flush();

    expect( scope.nomes.length ).toBe(vereadores.length);
  });

});
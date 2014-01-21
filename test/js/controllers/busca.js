'use strict'

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

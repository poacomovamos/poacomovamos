'use strict'

describe('Controller: busca', function() {

  var $scope, ctrl, $httpBackend, $resource;
  var vereadores;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller, $injector) {
  /*  $scope = $rootScope.$new();
    ctrl = $controller('BuscaCtrl', {
      $scope: $scope
    });

    $httpBackend = $injector.get('$httpBackend');
    $resource = $injector.get('$resource');

    $httpBackend.expectGET('/foo_bar').respond();
    resourceArray = $resource('/foo_bar').query();*/
  }));

  it('deve retornar 36 nomes', function(){
    /*expect($scope.extrairNomes().length).toBe(36);*/
  });

});

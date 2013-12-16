'use strict'

describe('Controller: perfis', function() {

  var $scope, ctrl;
  var vereador;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('VereadorCtrl', {
      $scope: $scope,
      vereador: ['Nome', 'Partido', 'email', 'telefone', 'twitter', 'facebook', 'foto']
    });
  }));

  it('deve colocar os label no escopo', function() {
    expect($scope.vereador).toBeDefined();
    expect($scope.vereador.length).toBe(7);
  });

});

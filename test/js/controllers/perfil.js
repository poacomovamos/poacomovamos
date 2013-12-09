'use strict'

describe('Controller: perfis', function() {

  var $scope, ctrl;
  var vereadores;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('PerfilCtrl', {
      $scope: $scope,
      vereadores: ['Nome', 'Partido', 'email', 'telefone', 'twitter', 'facebook', 'foto']
    });
  }));

  it('deve colocar os label no escopo', function() {
    expect($scope.vereadores).toBeDefined();
    expect($scope.vereadores.length).toBe(7);
  });

});

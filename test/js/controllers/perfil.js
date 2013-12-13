'use strict'

describe('Controller: perfis', function() {

  var $scope, ctrl;
  var perfil;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('PerfilCtrl', {
      $scope: $scope,
      perfil: ['Nome', 'Partido', 'email', 'telefone', 'twitter', 'facebook', 'foto']
    });
  }));

  it('deve colocar os label no escopo', function() {
    expect($scope.perfil).toBeDefined();
    expect($scope.perfil.length).toBe(7);
  });

});

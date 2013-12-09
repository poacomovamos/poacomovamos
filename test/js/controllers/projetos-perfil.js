'use strict'

describe('Controller: Perfil', function(){

  var $scope, ctrl;
  var vereadores;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {

    $scope = $rootScope.$new();

    ctrl = $controller('PerfilCtrl', {
      $scope: $scope,
      vereadores: {
        voto: 10,
        absteve: 10
      }
    });


  }));

  it('verifica existem votos', function() {
    expect($scope.vereadores.voto).toBe(10);
    expect($scope.vereadores.absteve).toBe(10);
  });


});

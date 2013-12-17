'use strict'

describe('Controller: Perfil', function(){

  var $scope, ctrl;
  var vereador;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {

    $scope = $rootScope.$new();

    ctrl = $controller('VereadorCtrl', {
      $scope: $scope,
      vereador: {
        projetosVotos: {
          voto: 10,
          absteve: 10,
          repExterna: 20,
          ausente: 30
        }
      }
    });
  }));

  it('verifica existem votos', function() {
    expect($scope.vereador.projetosVotos.voto).toBe(10);
    expect($scope.vereador.projetosVotos.absteve).toBe(10);
    expect($scope.vereador.projetosVotos.repExterna).toBe(20);
    expect($scope.vereador.projetosVotos.ausente).toBe(30);
  });

});

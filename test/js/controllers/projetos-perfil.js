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
    expect($scope.projetosVotos.voto).toBe(10);
    expect($scope.projetosVotos.absteve).toBe(10);
    expect($scope.projetosVotos.repExterna).toBe(20);
    expect($scope.projetosVotos.ausente).toBe(30);
  });

});

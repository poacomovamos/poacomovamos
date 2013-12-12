'use strict'

describe('Controller: Perfil', function(){

  var $scope, ctrl;
  var perfil;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {

    $scope = $rootScope.$new();

    ctrl = $controller('PerfilCtrl', {
      $scope: $scope,
      perfil: {
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
    expect($scope.perfil.projetosVotos.voto).toBe(10);
    expect($scope.perfil.projetosVotos.absteve).toBe(10);
    expect($scope.perfil.projetosVotos.repExterna).toBe(20);
    expect($scope.perfil.projetosVotos.ausente).toBe(30);
  });

});

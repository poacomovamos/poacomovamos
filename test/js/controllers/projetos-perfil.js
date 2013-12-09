'use strict'

describe('Controller: Perfil', function(){

  var $scope, ctrl;
  var voto;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {


    var parent = $rootScope;
    var child = parent.$new();

    $scope = $rootScope.$new();

    ctrl = $controller('PerfilCtrl', {
      $scope: $scope,
      voto: 10
    });


  }));

  it('verifica existem votos', function() {
    expect($scope.voto).toBe(10);
  });


});

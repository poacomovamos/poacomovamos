'use strict'

describe('Controller: vereadores', function() {

  var $scope, ctrl;
  var vereadores;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('VereadoresCtrl', {
      $scope: $scope,
      vereadores: ['Jose Sarney', 'Fernando Collor', 'Itamar Franco', 'Fernando Henrique Cardoso', 'Luis Inacio Lula', 'Dilma Rousseff']
    });
  }));

  it('deve colocar os vereadores no escopo', function() {
    expect($scope.vereadores).toBeDefined();
    expect($scope.vereadores.length).toBe(5);
  });

});

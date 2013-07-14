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

  it('deve embaralhar todos os vereadores antes de retornar', function() {
    expect($scope.vereadores.length).toBe(6);
    expect($scope.vereadores[0]).not.toBe('Jose Sarney');
    expect($scope.vereadores[1]).not.toBe('Fernando Collor');
    expect($scope.vereadores[2]).not.toBe('Itamar Franco');
    expect($scope.vereadores[3]).not.toBe('Fernando Henrique Cardoso');
    expect($scope.vereadores[4]).not.toBe('Luis Inacio Lula');
    expect($scope.vereadores[5]).not.toBe('Dilma Rousseff');
  });
});

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
  });
});

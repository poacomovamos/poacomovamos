'use strict'

describe('Controller: perfis', function() {

  var $scope, ctrl;
  var vereador;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('VereadorCtrl', {
      $scope: $scope,
      vereador: {
        nome: "Airto Ferronato",
        partido: "PSB",
        email: "ferronato@camarapoa.rs.gov.br",
        telefone: "4221/4222/4223",
        twitter: "@AirtoFerronato",
        facebook: "https://www.facebook.com/airtoferronato",
        foto: "airtoferronato2.jpg"
      }
    });
  }));

  it('deve verificar se retorna os dados de um vereador', function() {
    expect($scope.vereador.nome).toBe("Airto Ferronato");
    expect($scope.vereador.partido).toBe("PSB");
    expect($scope.vereador.email).toBe("ferronato@camarapoa.rs.gov.br");
    expect($scope.vereador.telefone).toBe("4221/4222/4223");
    expect($scope.vereador.twitter).toBe("@AirtoFerronato");
    expect($scope.vereador.facebook).toBe("https://www.facebook.com/airtoferronato");
    expect($scope.vereador.foto).toBe("airtoferronato2.jpg");
  });

});

'use strict'

describe('Controller: vereadores', function() {

  var $scope, ctrl;
  var vereadores;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($rootScope, $controller) {
    $scope = $rootScope.$new();
    ctrl = $controller('VereadoresCtrl', {
      $scope: $scope,
      vereadores: [
        {
          nome: "Airto Ferronato",
          partido: "PSB",
          email: "ferronato@camarapoa.rs.gov.br",
          telefone: "4221/4222/4223",
          twitter: "@AirtoFerronato",
          facebook: "https://www.facebook.com/airtoferronato",
          foto: "airtoferronato2.jpg"
        },
        {
          nome: "Maicon Ferreira",
          partido: "PT",
          email: "ferronato@camarapoa.rs.gov.br",
          telefone: "4221/4222/4223",
          twitter: "@AirtoFerronato",
          facebook: "https://www.facebook.com/airtoferronato",
          foto: "airtoferronato2.jpg"
        }
      ]
    });
  }));

  it('deve inserir vereadores no escopo', function() {
    expect($scope.vereadores[0].nome).toBe("Airto Ferronato");
    expect($scope.vereadores[1].nome).toBe("Maicon Ferreira");

    expect($scope.vereadores[0].partido).toBe("PSB");
    expect($scope.vereadores[1].partido).toBe("PT");

    expect($scope.vereadores[0].email).toBe("ferronato@camarapoa.rs.gov.br");
    expect($scope.vereadores[1].email).toBe("ferronato@camarapoa.rs.gov.br");

    expect($scope.vereadores[0].telefone).toBe("4221/4222/4223");
    expect($scope.vereadores[1].telefone).toBe("4221/4222/4223");

    expect($scope.vereadores[0].twitter).toBe("@AirtoFerronato");
    expect($scope.vereadores[1].twitter).toBe("@AirtoFerronato");

    expect($scope.vereadores[0].facebook).toBe("https://www.facebook.com/airtoferronato");
    expect($scope.vereadores[1].facebook).toBe("https://www.facebook.com/airtoferronato");

    expect($scope.vereadores[0].foto).toBe("airtoferronato2.jpg");
    expect($scope.vereadores[1].foto).toBe("airtoferronato2.jpg");
  });
  
});

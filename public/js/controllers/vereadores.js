'use strict';

angular.module('poaComoVamos').
	controller('VereadoresCtrl', ['$scope', 'vereadores', function ($scope, vereadores) {
    $scope.percentualPresenca = function (presencasDuranteMandato) {
      var numeroSecoesDuranteMandato = 10;
      return (presencasDuranteMandato / numeroSecoesDuranteMandato) * 100;
    };

    $scope.vereadores = vereadores;
}]);

'use strict';

angular.module('poaComoVamos').
	controller('VereadoresCtrl', ['$scope', 'vereadores', function ($scope, vereadores) {

    $scope.vereadores = vereadores;
    
}]);

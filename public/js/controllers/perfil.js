'use strict';

angular.module('poaComoVamos').
  controller('PerfilCtrl', ['$scope', 'vereadores', '$routeParams', function ($scope, vereadores, $routeParams) {

      //Perfil aqui embaixo
      $scope.vereadores = vereadores;

      console.log($routeParams.email);


      //Projetos aqui embaixo

}]);

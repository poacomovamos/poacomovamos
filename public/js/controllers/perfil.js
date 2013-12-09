'use strict';

angular.module('poaComoVamos').

  controller('PerfilCtrl', ['$scope', 'vereadores', '$routeParams', function ($scope, vereadores, $routeParams) {

      //Perfil aqui embaixo
      $scope.vereadores = vereadores;

      //$routeParams.email

      //console.log($routeParams.email);


      //Projetos aqui embaixo
      $scope.voto = voto;

}]);

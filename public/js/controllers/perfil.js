'use strict';

angular.module('poaComoVamos').

  controller('PerfilCtrl', ['$scope', 'vereadores', '$routeParams', function ($scope, vereadores, $routeParams) {

      //Perfil aqui embaixo
      $scope.perfil = vereadores;

      //console.log($routeParams.email);
      //console.log($scope.perfil);


      //Projetos aqui embaixo
      $scope.perfil.voto = vereadores.voto;

}]);

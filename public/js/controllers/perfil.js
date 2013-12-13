'use strict';

angular.module('poaComoVamos').

  controller('PerfilCtrl', ['$scope', 'perfil', '$routeParams', function ($scope, perfil, $routeParams) {


  //Perfil aqui embaixo



  //Projetos aqui embaixo
  $scope.perfil = perfil;
  console.log(perfil);

}]);

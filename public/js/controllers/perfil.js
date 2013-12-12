'use strict';

angular.module('poaComoVamos').

  controller('PerfilCtrl', ['$scope', 'perfil', '$routeParams', function ($scope, perfil, $routeParams) {

  //Perfil aqui embaixo
  $scope.perfil = perfil;



  //Projetos aqui embaixo
  $scope.projetosVotos = perfil.projetosVotos;
  console.log(perfil);

}]);

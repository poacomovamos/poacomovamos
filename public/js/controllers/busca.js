angular.module('poaComoVamos').
    controller('BuscaCtrl', ['$scope', '$http' , function ($scope, $http) {

    $scope.carregarVereadores = function(){
      $scope.chamaApiVereadores().
      success($scope.extraiNomesParaScopo).
      error($scope.falhaAoCarregarVereadores);
    }

    $scope.chamaApiVereadores = function(){
      return $http({method: 'GET', url: '/api/vereador'});
    }

    $scope.extraiNomesParaScopo = function(vereadores){
      $scope.nomes = $scope.extrairNomes(vereadores);
    }

    $scope.extrairNomes = function(vereadores){
      vereadores = vereadores || [];

      var nomes = [];
      for (idx in vereadores) {
        nomes.push(vereadores[idx].nome);
      }

      return nomes;
    }

    $scope.falhaAoCarregarVereadores = function(data, status, headers, config) {
      console.log("Ocorreu algum erro na requisicao \n");
      console.log(data + status);
    }

    $scope.carregarVereadores();

}]).
directive('autoComplete', function($timeout, $location) {
  return function(scope, iElement, iAttrs) {
    scope.$watch(function(source){
      if(!source) return

      iElement.autocomplete({
        source: scope.nomes,
        select: function() {
          $timeout(function() {
            iElement.trigger('input');
            scope.$apply(function() {
              $location.path("/vereador/" + iElement[0].value);
            });
          }, 0);
        }
      });
    })
  };
});
angular.module('poaComoVamos').
    controller('BuscaCtrl', ['$scope', '$http' , function ($scope, $http) {

    $scope.carregarVereadores = function(){
      $scope.chamaApiVereadores().success($scope.extraiNomesParaScopo);
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

    $scope.carregarVereadores();

}]).
directive('autoComplete', function($timeout, $location) {
  return function(scope, iElement, iAttrs) {
    scope.$watch(iAttrs.uiItems, function(source){
      if(!source) return

      iElement.autocomplete({
        source: source,
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

angular.module('poaComoVamos').
    controller('BuscaCtrl', ['$scope', '$http' , function ($scope, $http) {

    $http({method: 'GET', url: '/api/vereador'}).
    success(function(data, status, headers, config) {
        $scope.extrairNomes(data);
    }).
    error(function(data, status, headers, config) {
        console.log(data + status);
    });

    $scope.extrairNomes = function(vereadores){
        if(!vereadores) return [];

        $scope.names = [];
        for (var i = vereadores.length - 1; i >= 0; i--) {
            $scope.names.push(vereadores[i].nome);
        };
    }
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

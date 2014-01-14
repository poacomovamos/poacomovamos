angular.module("poaComoVamos.components", []).
  directive('header', function() {
    return {
      restrict: 'C',
      replace: true,
      transclude: true,
      controller: "BuscaCtrl",
      templateUrl: 'views/partials/header.html'
    };
  });

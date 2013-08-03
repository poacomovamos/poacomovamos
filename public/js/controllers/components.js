angular.module("poaComoVamos.components", []).

  directive('header', function() {
    return {
      restrict: 'C',
      replace: true,
      transclude: true,
      templateUrl: 'views/partials/header.html'
    };
  });

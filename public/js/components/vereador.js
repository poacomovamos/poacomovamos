angular.module("poaComoVamos.vereador", []).

  directive('perfil', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/perfil.html'
    };
  }).

  directive('grafico', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/grafico.html'
    };
  }).

  directive('projetos', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/projetos.html'
    };
  }).

  directive('interna', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/logo-interna.html'
    };
  });
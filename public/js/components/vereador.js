angular.module("poaComoVamos.vereador", []).

  directive('logointerna', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/logo-interna.html'
    };
  }).

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

  directive('rodapeinterna', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereador/partials/rodape-interna.html'
    };
  });
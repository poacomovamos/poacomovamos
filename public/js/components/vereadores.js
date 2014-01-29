angular.module("poaComoVamos.vereadores", []).

  directive('logohome', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/logo-home.html'
    };
  }).

  directive('slogan', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/slogan.html'
    };
  }).

  directive('listaDeVereadores', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/lista.html'
    };
  }).

  directive('contato', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/contato.html'
    };
  }).

  directive('rodapehome', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/rodape-home.html'
    };
  });
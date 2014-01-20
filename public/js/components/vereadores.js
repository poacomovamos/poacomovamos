angular.module("poaComoVamos.vereadores", []).

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

  directive('rodape', function() {
    return {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'views/vereadores/partials/rodape.html'
    };

  });

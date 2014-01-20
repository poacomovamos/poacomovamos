'use strict';

angular.module('poaComoVamos.filters', []);
angular.module('poaComoVamos.servicos', ['ngResource']);

angular.module('poaComoVamos', ['poaComoVamos.servicos', 'poaComoVamos.filters', 'poaComoVamos.comuns', 'poaComoVamos.vereadores', 'poaComoVamos.vereador'])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores/vereadores.html',
        controller: 'VereadoresCtrl',
        resolve: {
          vereadores: function(Vereadores) { return Vereadores.query() }
        }
      })
      .when('/vereador/:nome', {
        templateUrl: '../views/vereador/vereador.html',
        controller: 'VereadorCtrl',
        resolve: {
          vereador: function($route, Vereador) { return Vereador.get( { nome: $route.current.params.nome } ) }
        }
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

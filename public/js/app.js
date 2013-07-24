'use strict';

angular.module('poaComoVamos.filters', []);
angular.module('poaComoVamos.servicos', ['ngResource']);

angular.module('poaComoVamos', ['poaComoVamos.servicos', 'poaComoVamos.filters'])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores.html',
        controller: 'VereadoresCtrl',
        resolve: {
          //$resource.query não retorna uma promise, retorna um object ou array que sera populado quando devido
          vereadores: function(Vereadores) { return Vereadores.query() }
        }
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

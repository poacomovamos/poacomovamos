'use strict';

angular.module('poaComoVamos', ['poaComoVamos.servicos'])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores.html',
        controller: 'VereadoresCtrl',
        resolve: {
          vereadores: function(Vereadores) {
              return Vereadores.query()
          }
        }
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

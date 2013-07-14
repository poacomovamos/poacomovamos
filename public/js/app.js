'use strict';

var poaCvApp = angular.module('poaComoVamos', []);

poaCvApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores.html',
        controller: 'VereadoresCtrl',
        resolve: {
          vereadores: ['ver1', 'ver2', 'ver3']
        }

      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

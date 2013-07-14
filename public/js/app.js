'use strict';

var poaCvApp = angular.module('poaComoVamos', []);

poaCvApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores.html',
        controller: 'VereadoresCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

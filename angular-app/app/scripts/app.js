'use strict';

angular.module('PoaComoVamos', [])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/vereadores.html',
        controller: 'VereadoresCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

'use strict';

// Declare app level module
angular.module('poaComoVamos', ['poaComoVamos.controllers']).

  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/assiduidade', {
      templateUrl: 'partials/assiduities.html',
      controller: 'assiduitiesController'
    });
  }]);

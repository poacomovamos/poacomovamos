'use strict';

angular.module('poaComoVamos', ['poaComoVamos.servicos'])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../views/vereadores.html',
        controller: 'VereadoresCtrl',
        resolve: {
          vereadores: function(Vereadores, $q) {

            var deferred = $q.defer();

            Vereadores.query(function(successData) {
              deferred.resolve(successData);
            }, function(errorData) {
              deferred.reject();
            });

            return deferred.promise;
          }
        }
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);

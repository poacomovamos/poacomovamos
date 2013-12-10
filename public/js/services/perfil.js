angular.module('poaComoVamos.servicos')
  .factory('Perfil',['$resource', '$routeParams',
    function($resource, $routeParams) {
      return $resource('/api/perfil/:email', {email: "@test"});
}]);

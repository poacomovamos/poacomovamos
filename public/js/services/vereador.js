angular.module('poaComoVamos.servicos')
  .factory('Vereador',['$resource', '$routeParams',
    function($resource, $routeParams) {
      return $resource('/api/vereador/:nome', {nome: "@test"});
}]);

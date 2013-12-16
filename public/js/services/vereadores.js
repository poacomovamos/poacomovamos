angular.module('poaComoVamos.servicos')
  .factory('Vereadores',['$resource', '$routeParams',
    function($resource, $routeParams) {
      return $resource('/api/vereador');
}]);

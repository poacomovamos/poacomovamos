angular.module('poaComoVamos.servicos')
  .factory('Vereadores',['$resource', '$routeParams',
    function($resource, $routeParams) {
      console.log($routeParams);
      return $resource('/api/vereador');
}]);

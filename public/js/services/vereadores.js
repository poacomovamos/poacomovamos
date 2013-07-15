angular.module('poaComoVamos.servicos', ['ngResource'])
  .factory('Vereadores',['$resource', 
    function($resource) {
      return $resource('/api/vereador');
}]);

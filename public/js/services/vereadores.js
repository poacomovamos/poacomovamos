angular.module('poaComoVamos.servicos')
  .factory('Vereadores',['$resource',
    function($resource) {
      return $resource('/api/vereador');
}]);

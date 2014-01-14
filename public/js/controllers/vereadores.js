'use strict';

angular.module('poaComoVamos').
    controller('VereadoresCtrl', ['$scope', 'vereadores', function ($scope, vereadores) {

        $scope.vereadores = vereadores;

}]);

angular.module('poaComoVamos').
    controller('BuscaCtrl', ['$scope', '$http' , function ($scope, $http) {

  /*      $scope.names = Array();

        $http.get('/api/vereador').success(function(data){
            for (var i = data.length - 1; i >= 0; i--) {
                $scope.names[i] = data[i].nome;
            };
            console.log("Array : " + $scope.names);
        }).error(function(data){
            console.log(data);
        });*/

        $scope.names = ["Airto Ferronato", "Alberto Kopittke", "Alceu Brasinha", "Any Ortiz", "Bernardino Vendruscolo", "Cassio Trogildo", "Clàudio Janta", "Delegado Cleiton", "Dr. Thiago", "Elizandro Sabino", "Engº Comassetto", "Fernanda Melchionna", "Guilherme Socias Villela", "Idenir Cecchim", "João Carlos Nedel", "João Derly", "Jussara Cony", "Lourdes Sprenger", "Luiza Neves", "Marcelo Sgarbossa", "Márcio Bins Ely", "Mario Fraga", "Mario Manfro", "Mauro Pinheiro", "Mônica Leal", "Nereu D'Avila", "Paulinho Motorista", "Paulo Brum", "Pedro Ruas", "Professor Garcia", "Reginaldo Pujol", "Séfora Mota", "Sofia Cavedon", "Tarciso Flecha Negra", "Valter Nagelstein", "Waldir Canal"];

}]).directive('autoComplete', function($timeout, $location) {
    return function(scope, iElement, iAttrs) {
        iElement.autocomplete({
            source: scope[iAttrs.uiItems],
            select: function() {
                $timeout(function() {
                  iElement.trigger('input');
                  scope.$apply(function() {
                        $location.path("/vereador/" + iElement[0].value);
                  });
                }, 0);
            }
        });
    };
});

'use strict';

angular.module('poaComoVamos').
    controller('VereadoresCtrl', ['$scope', 'vereadores', function ($scope, vereadores) {

        $scope.vereadores = vereadores;

}]);

angular.module('poaComoVamos').
    controller('BuscaCtrl', ['$scope', '$http' , function ($scope, $http) {
        $http.get('/api/vereador').success(function(data){
            $scope.vereadors = data;
        }).error(function(data){
            console.log(data);
        });

}]);

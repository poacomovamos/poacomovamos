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

       $scope.limpar = function(){
            /*$scope.busca = '';*/
            /*alert("foi");*/
           /* document.getElementsByClassName("busca")[0].style = "display: none";
            document.getElementsByClassName("busca")[0].style = "display: block";*/
        }

}]);

/*var limparCampoDePesquisa = function(){
    document.getElementsByTagName("input")[0].value = "";
    document.getElementsByClassName("busca")[0].style = "display: none";
    document.getElementsByClassName("busca")[0].style = "display: block";
}*/


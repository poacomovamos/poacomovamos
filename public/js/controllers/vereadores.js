'use strict';

angular.module('poaComoVamos').controller('VereadoresCtrl', ['$scope', 'vereadores', function ($scope, vereadores) {

    $scope.percentualPresenca = function (presencasDuranteMandato) {
      var numeroSecoesDuranteMandato = 10;
      return (presencasDuranteMandato / numeroSecoesDuranteMandato) * 100;
    };
    
    var shuffle = function(array) {
      var newArray = array.slice();
      var i = newArray.length, j, temp;
    
      while ( --i )
      {
        j = Math.floor( Math.random() * (i - 1) );
        temp = newArray[i];
        newArray[i] = newArray[j];
        newArray[j] = temp;
      }
      return newArray;
    };

    $scope.vereadores = shuffle(vereadores);
}]);

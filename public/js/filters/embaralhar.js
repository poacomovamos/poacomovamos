'use strict'

angular.module('poaComoVamos.filters').
  /**
   * filtro embaralhar:
   */
	filter('embaralhar', function(){

    var embaralharArray = function(array){
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
    }

    var naoResource = function(object){
      return angular.isFunction(object['$then']) === false;
    }

    var estaResolvido = function(object){
      return object['$resolved'] === true
    }

    var podeSerEmbaralhado= function(arrayOriginal){
      return naoResource( arrayOriginal ) || estaResolvido( arrayOriginal )
    }

  var embaralhado = [];

	return function(arrayOriginal){      
      if(embaralhado.length > 0) return embaralhado

      if (podeSerEmbaralhado( arrayOriginal )){
        embaralhado = embaralharArray( arrayOriginal ) 
        return embaralhado;
      } else{
        return [];
      }
	 }
	});
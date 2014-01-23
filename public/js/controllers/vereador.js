'use strict';

angular.module('poaComoVamos').

  controller('VereadorCtrl', ['$scope', 'vereador', '$routeParams', function ($scope, vereador, $routeParams) {

  $scope.initGrafico = function(){
	 var bar = new RGraph.Bar('cvs', [30,5,22,10,3])
		.Set('labels', ['Votou','Não votou', 'Absteve-se','Rep. Externa','Ausente'])
		.Set('text.color', '#FFFFFF')
    .Set('text.size', 12)
    .Set('colors.sequential', true)
		.Set('background.grid', false)
		.Draw();

		var colors = ['#297FB9'];

		bar.Set('chart.colors', colors);
		RGraph.Clear(bar.canvas);
		RGraph.Redraw();
  }

  $scope.vereador = vereador;

}]);

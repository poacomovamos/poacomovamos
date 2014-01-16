'use strict';

angular.module('poaComoVamos').

  controller('VereadorCtrl', ['$scope', 'vereador', '$routeParams', function ($scope, vereador, $routeParams) {

  $scope.initGrafico = function(){
	 var bar = new RGraph.Bar('cvs', [30,22,10,3])
		.Set('labels', ['Votou', 'Absteve-se','Rep. Externa','Ausente'])
		.Set('text.color', '#FFFFFF')
		.Set('colors.sequential', true)
		.Set('background.grid', false)

		.Draw();

		var colors = [];

		RGraph.each (bar.coords, function (key, value){
			var x1 = value[0];
			var y1 = 0;
			var x2 = value[0] + value[2];
			var y2 = 0;

			colors[key] = RGraph.LinearGradient(bar, x1, y1, x2, y2, '#00c','blue');
		});

		bar.Set('chart.colors', colors);
		RGraph.Clear(bar.canvas);
		RGraph.Redraw();
  }

  $scope.vereador = vereador;

}]);

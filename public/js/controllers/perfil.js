'use strict';

angular.module('poaComoVamos').

  controller('PerfilCtrl', ['$scope', 'perfil', '$routeParams', function ($scope, perfil, $routeParams) {


  //Perfil aqui embaixo
  $scope.initGrafico = function(){
	 var bar = new RGraph.Bar('cvs', [4,8,5,3])
		.Set('labels', ['Votou', 'Absteve-se','Rep. Externa','Ausente'])
		.Set('colors.sequential', true)
		.Set('shadow', true)
		.Set('shadow.color', '#ccc')
		.Draw();

		/**
		* Now the chart has been drawn use the coords to create some appropriate gradients
		*/
		var colors = [];

		RGraph.each (bar.coords, function (key, value){
			// Because it's a horizontal gradient the Y coords don't matter
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



  //Projetos aqui embaixo
  $scope.perfil = perfil;

}]);

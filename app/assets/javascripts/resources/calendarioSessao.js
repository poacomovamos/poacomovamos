angular.module('calendarioSessao', [ 'ngResource' ]).
  factory('CalendarioSessao', function ($resource) {
    var CalendarioSessao = $resource("/sessoes.json");
});

//= require 'others/calendar'

function CalendarioSessaoCtrl($scope) {
  $scope.matrix = calendar.for(1, 2013);
  $scope.weekdaysHeader = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
  $scope.months = [
    {index: 1, name: "Janeiro"}, 
    {index: 2, name: "Fevereiro"}, 
    {index: 3, name: "Março"}, 
    {index: 4, name: "Abril"},
    {index: 5, name: "Maio"}, 
    {index: 6, name: "Junho"}, 
    {index: 7, name: "Julho"}, 
    {index: 8, name: "Agosto"}, 
    {index: 9, name: "Setembro"}, 
    {index: 10, name: "Outubro"},
    {index: 11, name: "Novembro"}, 
    {index: 12, name: "Dezembro"}]

  $scope.calendarFor = function (monthIndex) {
    return calendar.for(monthIndex, 2013);
  }
}


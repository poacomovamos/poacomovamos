//= require 'others/calendar'

function CalendarioSessaoCtrl($scope) {
  $scope.weekdaysHeader = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
  $scope.months = [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

  $scope.calendarRowsFor = function (monthIndex) {
    return calendar.for(monthIndex, 2013).getRows();
  }

  $scope.calendarCellClass = function (cellContent) {
    if (cellContent === "") {
      return "no_border";
    }
  }
}


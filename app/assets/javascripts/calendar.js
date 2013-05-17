//= require 'matrix'

var calendar = {
  for: function (month, year) {
    var i = 1,
    days = new Matrix(6, 7);

    var day = new Date(year, month - 1, i);
    var columnIndex = day.getDay();
    var rowIndex = 0;

    for (i; day.getMonth() == month - 1; i++) {
      days.set(rowIndex, columnIndex, day.getDate());

      day = new Date(year, month - 1, i);
      columnIndex = day.getDay();
      if (day.getDay() == 0) {
        rowIndex += 1;
      }
    } 

    return days;
  }
};

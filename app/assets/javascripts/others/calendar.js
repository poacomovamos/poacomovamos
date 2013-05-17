//= require 'others/matrix'

// position 0, 0 is sunday
var calendar = {
  for: function (month, year) {
    var i = 1,
    days = new Matrix(6, 7);

    var day = new Date(year, month - 1, i);
    var columnIndex = day.getDay();
    var rowIndex = 0;
    var first = true;

    for (i; day.getMonth() == month - 1; i++) {
      days.set(rowIndex, columnIndex, day.getDate());

      day = new Date(year, month - 1, i);
      columnIndex = day.getDay();
      if (day.getDay() == 0 && !first) {
        rowIndex += 1;
      }
      
      if (first) {
        first = false;
      }
    } 

    return days;
  }
};

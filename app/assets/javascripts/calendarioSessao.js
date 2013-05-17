//= require 'tablemaker'
//= require 'calendar'

var january2013 = calendar.for(2, 2013),
  table = tableMaker.create(january2013);

$(function () {
  $("#content").append(table);
});

//= require 'domTable'
//= require 'calendar'

var january2013 = calendar.for(1, 2013),
  table = domTable.create({content: january2013, header: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S']});

$(function () {
  $("#content").append(table);
});

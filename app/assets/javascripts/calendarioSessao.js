//= require 'domTable'
//= require 'calendar'

var january2013 = calendar.for(1, 2013),
  table = domTable.create({content: january2013, header: ['S', 'T', 'Q', 'Q', 'S', 'S', 'D']});

$(function () {
  $("#content").append(table);
});

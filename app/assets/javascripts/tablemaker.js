var tableMaker = {
  create: function (data) {
    var i, j,
      table, column, row;
    
    var columns = data.numberOfColumns,
      rows = data.numberOfRows;

    table = document.createElement("table");
    for (i = 0; i < rows; i++) {
      column = document.createElement("tr");
      for (j = 0; j < columns; j++) {
        var row = document.createElement("td");
        row.setAttribute("class", "table_row row_" + i + "_" + j);
        row.innerHTML = data.get(i, j);
        column.appendChild(row);
      }
      table.appendChild(column);
    }
    return table;
  }
};


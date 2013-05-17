var domTable = (function () {
  var api = {};

  function createDomTableHeader(header) {
    domHeader = document.createElement("tr");
    header.forEach(function (headerElement) {
      var tableHeaderElement  = document.createElement("th");
      tableHeaderElement.innerHTML = headerElement;
      domHeader.appendChild(tableHeaderElement);
    });
    return domHeader;
  }

  function createDomTableRow(content, rowIndex, numberOfColumns) {
    var columnIndex,
      row = document.createElement("tr");
    for (columnIndex = 0; columnIndex < numberOfColumns; columnIndex++) {
      var column = document.createElement("td");
      column.setAttribute("class", "table_row row_" + rowIndex + "_" + columnIndex);
      column.innerHTML = content.get(rowIndex, columnIndex);
      row.appendChild(column);
    }
    return row;
  }

  api.create = function (params) {
    domTable = document.createElement("table");
    domTable.appendChild(createDomTableHeader(params.header));

    for (rowIndex = 0; rowIndex < params.content.numberOfRows; rowIndex++) {
      domTable.appendChild(createDomTableRow(params.content, rowIndex, params.content.numberOfColumns));
    }
    return domTable;
  };

  return api;
}());


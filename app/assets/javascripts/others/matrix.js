function Matrix(rows, columns, initialValue) {
  initialValue = initialValue || "";
  this.numberOfRows = rows;
  this.numberOfColumns = columns;

  this.data = (function () {
    var _data = [];
    for (var i=0; i < rows; i++) {
      var inner = [];
      _data.push(inner);
      for (var j=0; j < columns; j++) {
        inner.push(initialValue);
      }
    }
    return _data;
  }());
}

Matrix.prototype.getRows = function () {
  return this.data;
}

Matrix.prototype.set = function (x, y, value) {
  this.data[x][y] = value;
}

Matrix.prototype.get = function (x, y) {
  return this.data[x][y];
}



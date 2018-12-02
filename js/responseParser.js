function splitString(str) {
  var matrix = [];
  var vector = [];
  vector = str.split('\n');
  for(var i = 0; i < vector.length - 1; i++){
    var row = vector[i].split(',');
    matrix.push(row);
  }
  return matrix;
}
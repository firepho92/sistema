var callback = function(){
  var producto = new Producto();
  producto.readProducto();
};

if (
  document.readyState === "complete" ||
  (document.readyState !== "loading" && !document.documentElement.doScroll)
) {
  callback();
} else {
  document.addEventListener("DOMContentLoaded", callback);
}

function test(id){
  document.getElementById(id).style.position = 'relative';
  document.getElementById(id).style.top = 0;
}
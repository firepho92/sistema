var callback = function(){
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'http://localhost/sistema/cgi-bin/productos.pl', true);
  xhr.onreadystatechange = function() { // Call a function when the state changes.
    if (xhr.readyState === XMLHttpRequest.DONE) {
      document.getElementById('response').innerHTML = xhr.response;
    }
  }
  xhr.setRequestHeader(
    'Content-Type', 
    'application/x-www-form-urlencoded'
  );
  xhr.send();
};

if (
    document.readyState === "complete" ||
    (document.readyState !== "loading" && !document.documentElement.doScroll)
) {
  callback();
} else {
  document.addEventListener("DOMContentLoaded", callback);
}
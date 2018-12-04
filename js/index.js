var callback = function(){
  renderCards();
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
function removeDiv(divName){
  var div = document.getElementById(divName);
  if (div){ div.parentNode.removeChild(div);} 
}

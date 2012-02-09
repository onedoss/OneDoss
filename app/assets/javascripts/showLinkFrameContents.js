function loadLink(link, divName){
    function returnFunc(e) {
      var linkFrame = document.getElementById("linkFrame");
      var wrapperOffset = document.getElementById("resume_portal").offsetTop;
      var itemOffset = document.getElementById(divName).offsetTop;
      var newMargin = itemOffset-wrapperOffset;
      linkFrame.style.marginTop = newMargin+"px";
      linkFrame.innerHTML = "<iframe width='100%' height='100%' frameborder='0' scrolling='no' src='"+link+"'> </iframe>";
    }
    return returnFunc;
}

function unloadLink() {
    document.getElementById("linkFrame").innerHTML = "";
}
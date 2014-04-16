var activateDirectionsToggle = function(){
  var directionsPanel = document.getElementById('directions-panel');
  directionsPanel.style.display = 'none';
  var showDirectionsLink = document.getElementById('directions');

  showDirectionsLink.addEventListener('click', function(event){
    event.preventDefault();
    $("#map-canvas").slideToggle("drop");
    $("#directions-panel").slideToggle("drop");
    updateDirectionsLink();
  });

};

function updateDirectionsLink(){
 
  if ($("#directions").text() === "Show Directions"){
    $("#directions").text("Hide Directions");
  }

  else if ($("#directions").text() === "Hide Directions"){
    $("#directions").text("Show Directions");
  }

}
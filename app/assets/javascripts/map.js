var renderMap = function(trip){
  console.log("we are here at rendermap");
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;

  function initialize() {
    console.log("at initialzie")
    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map(document.getElementById('map-canvas'));
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('directions-panel'));  
    calcRoute();
  }

  function calcRoute() {
    console.log("at calc route");
    var request = {
        origin: trip.start_point_address,
        destination: trip.end_point_address,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
      else
        console.log("whattup");
    });
  }

  google.maps.event.addDomListener(window, 'load', initialize);

};
var renderMap = function(trip, errands, display_directions){
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map(document.getElementById('map-canvas'));
    directionsDisplay.setMap(map);
    calcRoute();
    if (display_directions === true){
      directionsDisplay.setPanel(document.getElementById('directions-panel'));
    }

  }

  function calcRoute() {
    var request;

    if (errands.length === 0){
      request = {
          origin: trip.start_point_address,
          destination: trip.end_point_address,
          travelMode: google.maps.TravelMode[trip.travel_mode.toUpperCase()]
      };
    }
    
    else {

      var errands_array = [];
      for (var i in errands) {
        errands_array.push({location: errands[i].address});
      }
      request = {
          origin: trip.start_point_address,
          waypoints: errands_array,
          destination: trip.end_point_address,
          optimizeWaypoints: true,
          travelMode: google.maps.TravelMode[trip.travel_mode.toUpperCase()]
      };
    }

    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
  }


  google.maps.event.addDomListener(window, 'load', initialize);
  
};








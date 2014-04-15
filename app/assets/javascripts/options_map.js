var renderOptionsMap = function(trip, options){
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map(document.getElementById('map-canvas'));
    directionsDisplay.setMap(map);
    calcRoute();
  }

  function calcRoute() {
    var request;    
    request = {
        origin: trip.start_point_address,
        destination: trip.end_point_address,
        travelMode: google.maps.TravelMode[trip.travel_mode.toUpperCase()]
    };

    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });

  }

  google.maps.event.addDomListener(window, 'load', initialize);
  google.maps.event.trigger(window, 'load');
  
};


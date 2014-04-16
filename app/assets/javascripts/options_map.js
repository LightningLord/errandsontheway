var renderOptionsMap = function(trip, errands, options){
  console.log("at renderoptions");

  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var optionsCoordinates = [];
  var markers = [];
  var iterator = 0;
  var infowindow = null;

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    map = new google.maps.Map(document.getElementById('map-canvas'));
    directionsDisplay.setMap(map);
    for (var i in options){
      optionsCoordinates.push(new google.maps.LatLng(options[i].latitude, options[i].longitude));
    }
    calcRoute();
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
      drop();
    });

    function drop() {
      for (var i = 0; i < optionsCoordinates.length; i++) {
        setTimeout(function() {
          addMarker();
        }, i * 200);
      }
    }

    function addMarker() {
      var marker = new google.maps.Marker({
        position: optionsCoordinates[iterator],
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        name: options[iterator].name,
        address: options[iterator].address,
        additionalTime: parseInt(options[iterator].extra_duration/60),
        icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+(iterator+1)+"|23b7e0|000000"
      });
      markers.push(marker);
      addListener(marker);
      iterator++;
      addListener();
    }

    function addListener(marker){
      google.maps.event.addListener(marker, 'click', function() {
        var unit;
        if (marker.additionalTime == 1){
          unit = " minute"
        } else {
          unit = " minutes"
        };
        if (infowindow) {
            infowindow.close();
        }
        infowindow = new google.maps.InfoWindow({
                content: "<h4>" + marker.name + " </h4>" + marker.address + "<br/> Additional Time: " + marker.additionalTime + unit + "<br/>"
        });
          infowindow.open(map, marker);
      });
    }
  }


   google.maps.event.addDomListener(window, 'load', initialize);
   google.maps.event.trigger(window, 'load');

};


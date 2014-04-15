var activateAutocomplete = function(){

  autocomplete = new google.maps.places.Autocomplete(
      (document.getElementById('trip_start_point_address')));
  autocomplete2 = new google.maps.places.Autocomplete(
      (document.getElementById('trip_end_point_address')));

  geolocate();


};

function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = new google.maps.LatLng(
          position.coords.latitude, position.coords.longitude);
      autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
          geolocation));
    });
  }
}

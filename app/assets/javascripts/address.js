var geoLocator = function(){
  this.controller = new geoLocator.Controller();
  this.controller.bindGeolocate(this.controller);
};

geoLocator.Controller = function() {
};

geoLocator.Controller.prototype = {
  bindGeolocate: function(controller) {
    $('#current-location').on('click', function(event){
      event.preventDefault();
      controller.getLocation();
    });
  },
  getLocation: function(){
    if ("geolocation" in navigator){
      navigator.geolocation.getCurrentPosition(this.onSuccess, this.showError);
    }
    else {
      alert('Geolocation is not supported in your browser.');
    }
  },
  onSuccess: function(position){
    var coords = [position.coords.latitude, position.coords.longitude];
    $.ajax({
      url: '/geocode-converter',
      type: 'post',
      data: {coords: coords}
    }).done(function(serverData){
      $('#trip_start_point_address').val(serverData)
    });
  }
};



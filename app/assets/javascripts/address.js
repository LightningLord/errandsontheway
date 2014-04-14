// function BindNewLocation() {
//   $('input[value="Current Location"]').on('click', getLocation());
// }

// function getLocation() {
//   if (navigator.geolocation)
//     {
//     navigator.geolocation.getCurrentPosition(showPosition);
//     }
//   else
//   {
//     console.log("Geolocation is not supported by this browser.");
//   }
// }

// function showPosition(position){
//   console.log(position.coords);
// }

var geoLocator = function(){
  this.controller = new geoLocator.Controller();
  this.controller.bindGeolocate(this.controller);
};

geoLocator.Controller = function() {

};

geoLocator.Controller.prototype = { 
  bindGeolocate: function(controller) {
    $('input[value="Current Location"]').on('click', function(){
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
      url: '/coordinates-converter',
      type: 'post',
      data: {coords: coords}
    }).done(function(serverData){
      console.log("this is working")
      console.log(serverData)
    });
  }
};



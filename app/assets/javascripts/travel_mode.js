var assignTravelMode = function(){
  var selectionMade = false;
  $(".travelmode").on('click', function(event){
    event.preventDefault();
    var id = $(this).attr('id');
    if (selectionMade === false) {
      $(this).addClass("selected");
      $("#new_trip").append("<input name='trip[travel_mode]' type='hidden' value='"+id+"' />");
      selectionMade = true;
    }
    else {
      $("#new_trip").find(":input[name='trip[travel_mode]']").remove();
      $("#new_trip").find("a.button.radius.travelmode.selected").attr('class', "button radius travelmode");
      $(this).addClass("selected");
      $("#new_trip").append("<input name='trip[travel_mode]' type='hidden' value='"+id+"' />");
    }
  });
};
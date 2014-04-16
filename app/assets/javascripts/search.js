$(function(){
  var mysearchController = new searchController
  mysearchController.initialize()

 });


  var searchController = function(){

  }

  searchController.prototype = {
    initialize: function(){
      $('#errand_search').on("submit", this.triggerAjax)
      $('#spinner').hide()
      $('#wait-message').hide();
    },

    triggerAjax: function(event){
      event.preventDefault()
      $('#spinner').show()
      $('#wait-message').show()
      $('.row').remove()
      $.ajax({
        url: '/options',
        method: 'get',
        data: $(this).serialize()
      }).done(function(server_data){
        var footer = $('footer');
        $('footer').remove();
        $('.route-map').remove();
        $('body').append(server_data);
        $('body').append(footer);
        $('#spinner').remove();
        $('#wait-message').remove();      
      }).fail(function(){
        $('#spinner').remove();
        $('#map-canvas').remove();
        $('#wait-message').remove();

        $('body').append('<div class="row"><div class="small-12 large-12 columns alert-box alert" data-alert="">Something went wrong. Please refresh the page!<a class="close" href="#">×</a></div></div>');
      })
    }
  }

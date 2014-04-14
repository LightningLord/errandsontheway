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
    },

    triggerAjax: function(event){
      event.preventDefault()
      $('#spinner').show()
      $('.row').remove()
      $.ajax({
        url: '/options',
        method: 'get',
        data: $(this).serialize()
      }).done(function(server_data){
        $('body').append(server_data)
        $('#spinner').remove()
        $('#map-canvas').remove()
      }).fail(function(){
        $('#spinner').remove()
        $('#map-canvas').remove()
        $('body').append('<div class="alert-box alert" data-alert="">Something went wrong. Please refresh the page!<a class="close" href="#">×</a></div>')
      })
    }
  }


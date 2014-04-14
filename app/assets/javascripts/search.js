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

    triggerAjax: function(e){
      e.preventDefault()
      $('#spinner').show()
      $('.row').hide()
      $.ajax({
        action: '/options',
        method: this.method,
        data: $(this).serialize()
      }).done(function(server_data){
        $('#spinner').hide()
        console.log(server_data)
      })
    }
  }
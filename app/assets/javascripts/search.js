$(function(){
  var mysearchController = new searchController
  mysearchController.initialize();
 });
  var searchController = function(){
  };

  searchController.prototype = {
    initialize: function(){
      $('#errand_search').on("submit", this.triggerAjax)
  }
  searchController.prototype = {
    initialize: function(){
      $('#errand_search').on("submit", this.triggerAjax);
      $('#spinner').hide();
      $('#wait-message').hide();
    },
    triggerAjax: function(event){
      event.preventDefault();
      $('#spinner').show();
      $('#wait-message').show();
      $('.row').remove();
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
        var template = $('#alert-template').html();
        $('#spinner').remove();
        $('#map-canvas').remove();
        $('#wait-message').remove();
        $('#errands-form').append(template.replace('{alertText}',
                        'Something went wrong. Please refresh the page!'));
      });
    }
  }

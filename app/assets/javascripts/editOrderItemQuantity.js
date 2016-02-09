$(document).ready(function() {
 $('.edit-order-item').on('click', function(event){
    event.preventDefault();

    //something
    var quantity = $(this).siblings('.endorsements_count');
 		
 		$.post(this.href, function(response){
      quantity.text(response.new_quantity);
    })
});


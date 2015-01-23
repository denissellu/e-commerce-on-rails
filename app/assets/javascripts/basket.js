$(document).ready(function() {

    $('.update_qunatity').on('click', function() {
        // If quantity ==  0 run delete order.
        $.post('/basket/ajax_update_quantity', {
        	quantity : $('.quantity_value').val(),
        	order_product_id : $('.order_product_id').val(),
        }, function(data) {
        	console.log(data)
            /*optional stuff to do after success */
        });
    });

    $('.add_to_basket').on('click',  function(){
        $('.basket_count').addClass('animated tada');
            $('.basket_count').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
                $('.basket_count').removeClass('animated tada');
            });
    });
});

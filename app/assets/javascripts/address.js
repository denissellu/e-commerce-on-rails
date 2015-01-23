$(document).ready(function() {
    $('.save_new_address').on('click', function() {
        var user_id = $('.user_id_address').val()
        var first_name = $('.new_address_first_name').val()
        var last_name = $('.new_address_last_name').val()
        var address_field = $('.new_address_field').val()
        var phone_number = $('.new_address_phone_number').val()


        $.post('/address/create', {
            address: {
                user_id: user_id,
                first_name: first_name,
                last_name: last_name,
                address_field: address_field,
                phone_number: phone_number,
            }
        }, function(data) {
            console.log(data)
            if (data.status === 'OK') {
                alert('Address Created')
                location.reload();
            }
        });
    });


    $('.delete_address').on('click', function() {
        var address_id = $('.address_id').val();
        console.log(address_id)
        $.post('/address/delete/' + address_id, function(data) {
            if (data.status === 'OK') {
                alert('Poof Deleted')
                location.reload();
            }
        });

    });

    $('.open-delete').on("click", function() {
        var address_id = $(this).data('id');
        $('.address_id').val(address_id);
    });

    $('.open-update').on("click", function() {
        var address_id = $(this).data('id');
        console.log(address_id)
        $('.address_update').val(address_id);
        $('.edit_address_first_name').val($('.'+address_id+'_first_name').html())
        $('.edit_address_last_name').val($('.'+address_id+'_last_name').html())
        $('.edit_address_field').val($('.'+address_id+'_address_field').html())
        $('.edit_address_phone_number').val($('.'+address_id+'_phone_number').html())
    });

    $('.update_address').on('click', function() {
    	var address_id = $('.address_update').val();
		var user_id = $('.user_id_address').val()
        var first_name = $('.edit_address_first_name').val()
        var last_name = $('.edit_address_last_name').val()
        var address_field = $('.edit_address_field').val()
        var phone_number = $('.edit_address_phone_number').val()

        $.post('/address/edit/'+ address_id, {
            address: {
                user_id: user_id,
                first_name: first_name,
                last_name: last_name,
                address_field: address_field,
                phone_number: phone_number,
            }
        }, function(data) {
            console.log(data)
            if (data.status === 'OK') {
                alert('Address Updated')
                location.reload();
            }
        });
    });

});

$(document).ready(function() {
	$('#item_list').sortable({
		axis: 'y',
		handle: '.handle',
		update: function() {
			$.post($(this).data('update-url'), $(this).sortable('serialize'));
		}
	});
	$('input:checkbox').on('change', function() {
		var id = $(this).attr('id').substring(5);
		var status = $(this).prop('checked') ? 1 : 0;
		$.ajax({
			url: '/items/' + id,
			type: 'PUT',
			dataType: 'json',
			data: { _method: 'PUT', item: { status_id: status } },
			success: function(data) {
				$('#item_' + id).toggleClass('complete');
			}
		});
	});
	$('form').on('click', '.remove_fields', function(e) {
		$(this).prev('input[type=hidden]').val('1');
		$(this).closest('div').hide();
		e.preventDefault();
	});
	$('form').on('click', '.add_fields', function(e) {
		time = new Date().getTime();
		regexp = new RegExp($(this).data('id'), 'g');
		$(this).before($(this).data('fields').replace(regexp, time));
		event.preventDefault();
	});
	$('a.delete_item').on('click', function(e) {
		var childId = $(this).closest('.item').attr('id').substr(5);
		$.post('/items/' + childId,
			{ _method: 'delete' },
			function(data, textStatus) {
				$('li.item#item_' + childId).fadeOut('slow', function() {
					$(this).remove();
				});
			},
			'json'
		);
		e.preventDefault();
	});
});

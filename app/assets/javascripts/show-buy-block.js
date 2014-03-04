$(document).ready(function(){
	$('.popular-item-outer').each(function(){
		$(this).click(function(){
			var description = $(this).parent().find($('.popular-item-description'));
			var buy = $(this).parent().find($('.popular-item-buy'));
			var arrow = $(this).find('.arrow');
			if ($(buy).hasClass('hidden')) {
				$(description).addClass('hidden').hide(700);
				$(buy).removeClass('hidden').show(700);
				$(arrow).show(700);
				return false;
			} else {
				$(buy).addClass('hidden').hide(700);
				$(description).removeClass('hidden').show(700);
				$(arrow).hide(1000);
				return false;
			}
		});
	})
});

var train_width = 0;
var train_timer;
var velocity;
var max_shift = 0;
var x = 0;

//Сдвигаем поезд при каждом обновлении кадра
function move_train()
{
	if (max_shift > 0)
	{
		x = x + velocity;

		if (x > 0) x = 0;
		if (x < (-1*(max_shift))) x = -1*(max_shift);

		$("#img_list").css("left", x + "px");
	}
}

//Функция находит позицию курсора мыши внутри элемента
function rPosition(element, mouseX, mouseY) {
	var offset = $(element).offset();
	var x = mouseX - offset.left;
	var y = mouseY - offset.top;

	return {'x': x, 'y': y};
}

$(function() {
	$("#img_list div a").hover(function() {
		$(this).find("img").animate({opacity: "0.2"},100);
		var largeAlt = $(this).find("img").attr("alt");
		$(this).find("span").show().text(largeAlt);
	}, function() {
		$(this).find("img").animate({opacity: "1"},50);
		$(this).find("span").hide();
	});

	//Считаем длину поезда, для этого складываем длины всех вагонов
	$("#img_list div").each(function (i) {
		train_width = train_width + $(this).width();
	});

	//Запускаем цикл анимации если курсор мыши над поездом
	$("div.scroller").mouseover(function(){
		train_timer = window.setInterval("move_train();", 10);
	});

	//Останавливаем цикл анимации если курсор мыши ушел с поезда
	$("div.scroller").mouseout(function(){
		window.clearInterval(train_timer);
	});

	$(window).resize(function(){
		velocity = 0;
		max_shift = train_width - $("div.scroller").width();
		move_train();
	});

	//Рассчитываем текущую скорость, которая зависит от координаты мышки на поезде
	$("div.scroller").mousemove(function(e){

		train_width = 0;

		$("#img_list div").each(function (i) {
			train_width = train_width + $(this).width();
		});

		//Считаем полудлину поезда, чтобы посчитать скорость, которая с разным знаком в разных половинах поезда
		var half_width = Math.round($(this).width()/2);

		var elementCoords = rPosition(this, e.pageX, e.pageY);
		//Пересчитали максимум, на который можно сдвигать поезд, он зависит от размеров окна
		max_shift = train_width - $(this).width();

		//Рассчитываем скорость. Делим на 100, чтобы было плавнее. Скорость будет в пределах от 0 до 9
		velocity = Math.round((half_width - elementCoords.x)/100);
	});
});

(function( $ ){

	$.fn.FloatSelect = function( options ){

		var defaults = {
		
		},
			settings = $.extend({}, defaults, options);

		return this.each(function(){
			var element = $(this),
				label = element.find("label"),
				select = element.find("select");
				options = element.find("option");
				optionsValue = $("<div class='js-float-select-status'></div>").prependTo(element);

			optionsValue.text(label.text());

			// var optionsContainer = $("<div class='float-option-container'></div>").appendTo(element).hide();

			element.click(function() {
				select.focus();
			})

			select.change(function(){
				optionsValue.text($("select option:selected").text());
				element.addClass("populated");
			})

			select.focus(function(){
				element.addClass("focus");
				if ($(this)[0].selectedIndex == 0) {
					optionsValue.text(options.eq(0).text());
				};
			})

			select.blur(function(){
				element.removeClass("focus");
				if ($(this)[0].selectedIndex == 0) {
					optionsValue.text(label.text());
				};
			})

		});

	};

})( jQuery );

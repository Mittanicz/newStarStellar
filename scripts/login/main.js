$(function() {
	$('.flags').on('click', function(e) {
		e.preventDefault();
		var langKey = $(this).attr('class').replace(/flags(.*)/, "$1").trim();
		Login.setLanguage(langKey);
		return false;
	});
	
	if(LoginConfig.isMultiUniverse)
	{
		$('.changeAction')
		.each(function() {
			updateUrls($(this));
		})
		.on('change', function() {
			updateUrls($(this));
		});
		
		// $('.changeUni').on('change', function() {
		// 	document.location.href = LoginConfig.basePath+'uni'+$(this).val()+'/index.php'+document.location.search;
		// });
	}
	else
	{
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+$(this).data('href');
		});
	}
});

var updateUrls = function(that, universe) {
	var universe = that.val();
	if (LoginConfig.unisWildcast) {
		var basePathWithSubdomain = LoginConfig.basePath.replace('://', '://uni' + universe + '.');
		that.parents('form').attr('action', function(i, old) {
			return basePathWithSubdomain+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return basePathWithSubdomain+$(this).data('href');
		});
	} else {
		that.parents('form').attr('action', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('href');
		});
	}
}

var Login = {
	setLanguage : function (LNG, Query) {
		$.cookie('lang', LNG);
		if(typeof Query === "undefined")
			document.location.href = document.location.href
		else
			document.location.href = document.location.href+Query;
	}
};

jQuery.validator.setDefaults({
	highlight: function(element) {
        $(element).closest('.c-formRow').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.c-formRow').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'c-validationMSG',
    errorPlacement: function(error, element) {
		if($(element).is(":checkbox")){
			error.insertAfter(element.parent().next())
		} else {
			error.insertAfter(element.parent())
		}
    }	
});

$(document).ready(function(){
    $('#navButton').click(function(){
        $('#navList').toggleClass('is-open');
        $(this).toggleClass('is-open');
	});

    $('*[data-sideBar]').click(function(){
        $('#loginSideBar').toggleClass('is-open');
	});
	
	$('*[data-modal]').click(function() {
		var modalID = $(this).attr('data-modal');
		console.log($('#' + modalID))
		$('#'+ modalID).css("display", "block");
	});
	
	$('*[data-dismiss]').click(function() {
		var modalID = $(this).attr('data-dismiss');
		console.log($('#' + modalID))
		$('#'+ modalID).css("display", "none");
	});
	
	$('*[data-toggle-action]').click(function() {
		$('*[data-toggle-action]').removeClass('is-active')
		$('*[data-toggle-content]').removeClass('is-show')
		$(this).addClass('is-active')
		var content = $(this).attr('data-toggle-action');
		$('#'+ content).toggleClass("is-show");
	});
	
	$('.c-dropdown').click(function() {
		$(this).toggleClass("is-show");
	});

	var x, i, j, l, ll, selElmnt, a, b, c;
	x = document.getElementsByClassName("c-select");
	l = x.length;
	for (i = 0; i < l; i++) {
	  selElmnt = x[i].getElementsByTagName("select")[0];
	  ll = selElmnt.length;
	  a = document.createElement("DIV");
	  a.setAttribute("class", "c-select__selected");
	  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	  x[i].appendChild(a);
	  b = document.createElement("ul");
	  b.setAttribute("class", "c-select__list c-select__hidden");
	  for (j = 1; j < ll; j++) {
		c = document.createElement("li");
		c.setAttribute("class", "c-select__item");
		c.innerHTML = selElmnt.options[j].innerHTML;
		c.addEventListener("click", function(e) {
			var y, i, k, s, h, sl, yl;
			s = this.parentNode.parentNode.getElementsByTagName("select")[0];
			sl = s.length;
			h = this.parentNode.previousSibling;
			for (i = 0; i < sl; i++) {
				if (s.options[i].innerHTML == this.innerHTML) {
				s.selectedIndex = i;
				h.innerHTML = this.innerHTML;
				y = this.parentNode.getElementsByClassName("c-select__same");
				yl = y.length;
				for (k = 0; k < yl; k++) {
					y[k].setAttribute("class", "c-select__item");
				}
				this.setAttribute("class", "c-select__same");
				break;
				}
			}
			h.click();
		});
		b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function(e) {
		e.stopPropagation();
		closeAllSelect(this);
		this.nextSibling.classList.toggle("c-select__hidden");
		this.classList.toggle("c-select__arrow");
	  });
	}
	
	function closeAllSelect(elmnt) {
	  /* A function that will close all select boxes in the document,
	  except the current select box: */
	  var x, y, i, xl, yl, arrNo = [];
	  x = document.getElementsByClassName("c-select__items");
	  y = document.getElementsByClassName("c-select__selected");
	  xl = x.length;
	  yl = y.length;
	  for (i = 0; i < yl; i++) {
		if (elmnt == y[i]) {
		  arrNo.push(i)
		} else {
		  y[i].classList.remove("c-select__arrow");
		}
	  }
	  for (i = 0; i < xl; i++) {
		if (arrNo.indexOf(i)) {
		  x[i].classList.add("c-select__hidden");
		}
	  }
	}
	
	document.addEventListener("click", closeAllSelect);


})
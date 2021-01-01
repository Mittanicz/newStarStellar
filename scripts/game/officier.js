function GetOfficerTime(Element, Time)
{
	if(Time == 0)
		return;
	
	$('#time_'+Element).text(GetRestTimeFormat(Time));
	Time--;
	window.setTimeout("GetOfficerTime("+Element+", "+Time+")", 1000)
}
function checkDesktop() {
	if(window.screen.availWidth >= 1024){
		return true
	} else {
		return false
	}
}
$(document).ready(function(){
	$('*[data-collapse]').click(function(e){
		e.stopPropagation();
		var id = $(this).attr('data-collapse');
		console.log(id)
		if(!checkDesktop()){
			if($(id).hasClass('collapseIs-active')){
				$('.collapseIs-active').slideToggle('slow')
				$('.collapseIs-active').removeClass('collapseIs-active')
			} else {
				$('.collapseIs-active').slideToggle('slow')
				$('.collapseIs-active').removeClass('collapseIs-active')
				$(id).slideToggle('slow');
				$(id).addClass('collapseIs-active');
			}
		} else {
			if($(id + 'Desktop').hasClass('collapseIs-active')){
				$('.collapseIs-active').hide();
				$('.collapseIs-active').removeClass('collapseIs-active')
			} else {
				$('.collapseIs-active').hide();
				$('.collapseIs-active').removeClass('collapseIs-active')
				$(id + 'Desktop').show();
				$(id + 'Desktop').addClass('collapseIs-active');
			}	
		}
	})

	$('#buildProgressMobile').click(function(){
		$('#buildContent').slideToggle('fast');
	});

	if($(window).width() >= 1024){
		$('#buildQueue').addClass('l-queueBox--desktop')
		$('#buildQueue').show()
		$('#buildContent, #buildInfoDesktop').show()
	}

})
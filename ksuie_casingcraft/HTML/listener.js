$(function(){
	$("#CasingInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showCasingInfo') {
				if (data.display === true) {
					$("#CasingInfo").show();
			   } else{
				$("#CasingInfo").hide();
			}
		}
	});
});

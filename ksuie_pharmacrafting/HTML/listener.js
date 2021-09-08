$(function(){
	$("#PharmaCraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showPharmaCraftInfo') {
				if (data.display === true) {
					$("#PharmaCraftInfo").show();
			   } else{
				$("#PharmaCraftInfo").hide();
			}
		}
	});
});

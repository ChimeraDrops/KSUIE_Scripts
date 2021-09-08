$(function(){
	$("#bioInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showBioInfo') {
				if (data.display === true) {
					$("#bioInfo").show();
			   } else{
				$("#bioInfo").hide();
			}
		}
	});
});

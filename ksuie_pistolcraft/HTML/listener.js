$(function(){
	$("#PistolCraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showPistolCraftInfo') {
				if (data.display === true) {
					$("#PistolCraftInfo").show();
			   } else{
				$("#PistolCraftInfo").hide();
			}
		}
	});
});

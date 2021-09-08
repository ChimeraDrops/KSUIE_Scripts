$(function(){
	$("#cokecraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showcokecraftInfo') {
				if (data.display === true) {
					$("#cokecraftInfo").show();
			   } else{
				$("#cokecraftInfo").hide();
			}
		}
	});
});

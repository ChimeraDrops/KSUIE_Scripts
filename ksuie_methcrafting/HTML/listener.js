$(function(){
	$("#methcraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showmethcraftInfo') {
				if (data.display === true) {
					$("#methcraftInfo").show();
			   } else{
				$("#methcraftInfo").hide();
			}
		}
	});
});

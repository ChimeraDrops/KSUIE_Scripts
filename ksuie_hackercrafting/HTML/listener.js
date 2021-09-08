$(function(){
	$("#hackercraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showhackercraftInfo') {
				if (data.display === true) {
					$("#hackercraftInfo").show();
			   } else{
				$("#hackercraftInfo").hide();
			}
		}
	});
});

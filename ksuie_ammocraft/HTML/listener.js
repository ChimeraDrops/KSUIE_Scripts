$(function(){
	$("#AmmoCraftInfo").hide();
        /* 'links' the js with the Nui message from craftingmenus.lua */
		window.addEventListener('message', (event) => {
			let data = event.data

			if(data.action == 'showAmmoCraftInfo') {
				if (data.display === true) {
					$("#AmmoCraftInfo").show();
			   } else{
				$("#AmmoCraftInfo").hide();
			}
		}
	});
});

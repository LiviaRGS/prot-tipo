func = function(){
	var file;
	file = get_open_filename("image file|*.jpg", "");
	if file != ""
	{
	    sprite_replace(Spr_Wallpaper,file,1,0,0,0,0);
	}	
}
image_index = 7
nome = "Papel de Parede"
draw_self()

if(variable_instance_exists(self,"nome")){
	draw_set_halign(fa_center)
	drawWithBorderExt(x,y+sprite_height/2+16,nome,c_white,c_black,1,24,32)	
	draw_set_halign(fa_left)
}

if(variable_instance_exists(self,"texto")){
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(x+sprite_width/2,y+sprite_height/2,texto)	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
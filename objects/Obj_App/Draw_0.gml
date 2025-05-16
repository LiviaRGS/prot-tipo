draw_self()

if(variable_instance_exists(self,"nome")){
	draw_set_halign(fa_center)
	draw_text_ext(x,y+sprite_height/2+16,nome,24,32)	
	draw_set_halign(fa_left)
}

if(variable_instance_exists(self,"texto")){
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(x+sprite_width/2,y+sprite_height/2,texto)	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}
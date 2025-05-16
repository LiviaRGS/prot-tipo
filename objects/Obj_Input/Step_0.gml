if(place_meeting(x,y,Obj_Mouse)){
	if(mouse_check_button_pressed(mb_left)){
		if(Selected == 1){
			Selected = 0
		}else{
			keyboard_string = Texto
			Selected = 1
		}
	}
}

if(Selected == 1){
	image_index = 1	
	if(string_length(keyboard_string) > 24){
		keyboard_string = string_copy(keyboard_string,0,24)	
	}else{
		Texto = keyboard_string	
	}
}else{
	image_index = 0
}
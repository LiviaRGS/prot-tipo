if(play == 0){
	image_index = 1	
	if(place_meeting(x,y,Obj_Mouse)){
		if(mouse_check_button_pressed(mb_left)){
			play = 1	
		}
	}
}

if(play == 1){
	if(image_index >= 4){
		image_index = 4
		if(set == 0){
			alarm[0] = 50
			set = 1	
		}
	}
}	
	
	
if(fade == 1){
	if(image_alpha > 0){
		image_alpha -= 0.01
	}else{
		room_goto(Room1)	
	}
}
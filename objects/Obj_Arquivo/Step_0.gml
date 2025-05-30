if(fase == 1){
	if(place_meeting(x,y,Obj_Mouse)){
		x += sign(x-Obj_Mouse.x)*spd
		y += sign(y-Obj_Mouse.y)*spd
		if(x < 0){
			x = room_width-64	
		}
		if(x > room_width){
			x = 64	
		}
		if(y < 0){
			y = room_height-64	
		}
		if(y > room_height){
			y = 64	
		}
		if(place_meeting(x,y,Obj_Mouse)){
			if(mouse_check_button_pressed(mb_left)){
				gameEnd(Obj_Control.Games.placeholder)	
			}
		}
	}
}
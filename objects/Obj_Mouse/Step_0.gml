x = mouse_x
y = mouse_y

if(place_meeting(x,y,Obj_Interactable)){
	image_index = 1	
}else{
	image_index = 0
}

if(mouse_check_button_pressed(mb_left)){
	audio_play_sound(Snd_Click,1,0)	
}

if(global.Game == 0){
	if(place_meeting(x,y,Obj_App)){
		if(mouse_check_button_pressed(mb_left)){
			var App = instance_place(x,y,Obj_App)
			if(variable_instance_exists(App,"func") && App.alarm[0] <= 0){
				App.backX = App.image_xscale
				App.backY = App.image_yscale
				App.image_xscale -= 0.1
				App.image_yscale -= 0.1
				App.alarm[0] = 10
			}
		}
	}
}

depth = -room_height-1
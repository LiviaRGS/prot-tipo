draw_set_font(Fnt_Main)


if(global.Menu != -1 && room == Room1){
	switch(Parts[global.Menu][0]){
		case "Folder":
			draw_sprite_stretched(Spr_Menu,0,64,64,room_width-64*2,room_height-64*2)
			if(Old != global.Menu){
				Clean()
				for(var i = 0; i < array_length(Parts[global.Menu][1]); i++){
					if(Parts[global.Menu][1][i][3] != 0){
						var App = instance_create_depth(128+96*i,128,-room_height-1,Obj_App)
						App.image_index = Parts[global.Menu][1][i][0]
						App.func = Parts[global.Menu][1][i][1]
						App.nome = Parts[global.Menu][1][i][2]
						array_push(Created,App)
					}
				}
				var Close = instance_create_depth(room_width-96,96,-room_height-1,Obj_App)
				Close.image_xscale = 0.7
				Close.image_yscale = 0.7
				Close.image_index = 3
				Close.func = function(){Obj_Control.Parts[global.Menu][2](); global.Menu = -1;}
				array_push(Created,Close)
				Old = global.Menu
			}
		break
		case "Pass":
			
			draw_sprite_stretched(Spr_Menu,0,room_width/2-256,room_height/2-64,512,128)
			if(Parts[global.Menu][2] == "Default"){
				draw_text(room_width/2-240,room_height/2-48,"O arquivo selecionado está protegido. Insira a senha:")
			}else{
				draw_text(room_width/2-240,room_height/2-48,Parts[global.Menu][2])
			}
			if(Old != global.Menu){
				Clean()
				Input = instance_create_depth(room_width/2-240,room_height/2-8,depth-1,Obj_Input)
				Input.image_xscale = 10
				var Button = instance_create_depth(room_width/2+96,room_height/2-8,depth-1,Obj_App)
				Button.sprite_index = Spr_Toolbar
				Button.image_xscale = 1.5
				Button.image_yscale = 0.3
				Button.texto = "Ok"
				Button.func = function(){
					if(Obj_Control.Input.Texto == Obj_Control.Parts[global.Menu][1]){
						Obj_Control.Parts[global.Menu][3]()
					}
				}
				var Close = instance_create_depth(room_width/2+236,room_height/2-44,-room_height-1,Obj_App)
				Close.image_xscale = 0.4
				Close.image_yscale = 0.4
				Close.image_index = 3
				Close.func = function(){Obj_Control.Parts[global.Menu][4](); global.Menu = -1;}
				array_push(Created,Close)
				array_push(Created,Input)
				array_push(Created,Button)
				Old = global.Menu	
			}
		break
		case "Text":
		
			draw_sprite_stretched(Spr_Menu,0,412,64,room_width-412*2,room_height-64*2)
			draw_text_ext(428,96,Parts[global.Menu][1],24,room_width-412*2)
			if(Old != global.Menu){
				Clean()
				
				var Close = instance_create_depth(room_width-432,84,-room_height-1,Obj_App)
				Close.image_xscale = 0.4
				Close.image_yscale = 0.4
				Close.image_index = 3
				Close.func = function(){Obj_Control.Parts[global.Menu][2](); global.Menu = -1;}
				array_push(Created,Close)
				Old = global.Menu
			}
		break
		case "CMD":
			draw_sprite_stretched(Spr_Toolbar,0,64,64,room_width-64*2,room_height-64*2)
			command = keyboard_string
			draw_text_ext(96,96,global.Path+" > "+command+"|",24,1100)
			if(array_length(show) > 0){
				for(var i = 0; i < array_length(show);i++){
					draw_text_color(96,128+32*i,show[i][0],show[i][1],show[i][1],show[i][1],show[i][1],1)	
				}
			}
			if(Old != global.Menu){
				Clean()
				keyboard_string = ""
				var Close = instance_create_depth(room_width-96,96,-room_height-1,Obj_App)
				Close.image_xscale = 0.7
				Close.image_yscale = 0.7
				Close.image_index = 3
				Close.func = function(){Obj_Control.Parts[global.Menu][1](); global.Menu = -1;}
				array_push(Created,Close)
				Old = global.Menu
			}
			if(keyboard_check_pressed(vk_enter)){
				var commandtype = ""
				for(var i = 0; i < string_length(command);i++){
					if(string_copy(command,i,1) == " "){
						commandtype = string_copy(command,0,i-1)
						break	
					}
					if(string_lower(string_copy(command,0,3)) == "dir"){
						commandtype = "dir"
						break
					}
				}
				commandtype = string_lower(commandtype)
				switch(commandtype){
					case "cd":
						var path = string_copy(command,4,string_length(command)-3)
						if(path != "../"){
							var valid = 0
							for(var i = 0; i < array_length(Parts);i++){
								if(Parts[i][0] == "Folder"){
										
										if(Parts[i][3] == path && Parts[i][4] != 2){
											valid = 1
											break
										}
										if(Parts[i][3] == global.Path+path && Parts[i][4] != 2){
											valid = 2
											
											break
										}
								}
							}
							if(valid == 1){
								global.Path = path+"/"
							}else if(valid == 2){
								global.Path = global.Path+path+"/"
							}else{
								cleanShow()
								array_push(show,["Erro! Caminho incorreto ou arquivo inesistente.",c_red])
							}
						}else{
							var usar = string_copy(global.Path,0,string_length(global.Path)-1)
							for(var i = string_length(usar);i > 0; i--){
								if(string_copy(usar,i,1) == "/"){
									global.Path = string_copy(usar,0,i)
									break
								}
							}
						}
						keyboard_string = ""
					break
					case "dir":
						var rest = string_copy(command,4,string_length(command)-3)
						var use = ""
						for(var i = 0; i < array_length(Parts); i++){
							if(Parts[i][0] == "Folder"){
								if(global.Path == Parts[i][3]+"/"){
									use = Parts[i]
									break
								}
							}
						}
				
						if(string_copy(rest,2,4) == "/a:h"){
							if(use == ""){
								cleanShow()
								array_push(show,["Pasta vazia!",c_red])		
								break
							}else{
								if(array_length(use[1]) == 0){
									cleanShow()
									array_push(show,["Pasta vazia!",c_red])		
								}else{
									cleanShow()
									for(var i = 0; i < array_length(use[1]);i++){
										if(use[1][i][2] != "Voltar" && use[1][i][3] == 0){
											array_push(show,[use[1][i][2],c_lime])	
										}
									}
								}
							}
						}else if (rest == "" || rest == " "){
							
							if(use == ""){
								cleanShow()
								array_push(show,["Pasta vazia!",c_red])		
								break
							}else{
								if(array_length(use[1]) == 0){
									cleanShow()
									array_push(show,["Pasta vazia!",c_red])		
								}else{
									cleanShow()
									for(var i = 0; i < array_length(use[1]);i++){
										if(use[1][i][2] != "Voltar" && use[1][i][3] == 1){
											array_push(show,[use[1][i][2],c_lime])	
										}
									}
								}
							}
						}else if (string_copy(rest,2,2) == "/a"){
							
							if(use == ""){
								cleanShow()
								array_push(show,["Pasta vazia!",c_red])		
								break
							}else{
								if(array_length(use[1]) == 0){
									cleanShow()
									array_push(show,["Pasta vazia!",c_red])		
								}else{
									cleanShow()
									for(var i = 0; i < array_length(use[1]);i++){
										if(use[1][i][2] != "Voltar"){
											array_push(show,[use[1][i][2],c_lime])	
										}
									}
								}
							}
						}else{
							cleanShow()
							array_push(show,["Erro! Comando desconhecido.",c_red])	
						}
					break
					default: 
						var usar = []
						for(var i = 0; i < array_length(Parts);i++){
							if(Parts[i][0] == "Folder" && Parts[i][4] != 2){
								if(Parts[i][3]+"/" == global.Path){
									usar = Parts[i][1]	
									break
								}
							}
						}
						if(array_length(usar) > 0){
							var erro = 1
							for(var i = 0; i < array_length(usar);i++){
								if(usar[i][3] != 2){
									if(usar[i][2] == command){
											Clean()
											usar[i][1]()
											erro = 0
									}
								}
							}
							if(erro == 1){
								cleanShow()
								array_push(show,["Erro! Nome incorreto ou arquivo inesistente.",c_red])	
							}
						}
					break
				}
				keyboard_string = ""
			}
			
		break
	}
}


if(Old != global.Menu && global.Menu == -1){
	Clean()
	Old = global.Menu
}

if(room == Room2){
	if(!instance_exists(Obj_Eye) && global.End == 0){
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text_transformed(room_width/2,room_height/2,"Idiota.",size,size,0)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		window_set_size(500,500)
	}else if(global.End == 1){
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(room_width/2,room_height/2,"Fim da Demo!\nPor favor, considere preencher o formulário que abrirá ao\nfechar o jogo!")
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	}
	if(timerswitch > 100){
		timerswitch--	
	}else{
		size += 2
		
		reset -= 5
		if(reset <= 0){
			if(!instance_exists(Obj_Eye) && global.End == 0){
				window_set_position(32,32)
				window_set_size(display_get_width(),display_get_height())
				instance_create_depth(0,0,-90,Obj_Eye)
			}
		}else{
			timerswitch = reset
			window_set_position(irandom(1200),irandom(900))
		}
	}
}
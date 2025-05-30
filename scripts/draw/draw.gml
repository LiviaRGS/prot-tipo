// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawWithBorder(X,Y,text,color,OutColor,offset){
	draw_set_color(OutColor)
	draw_text(X+offset,Y+offset,text)
	draw_text(X-offset,Y+offset,text)
	draw_text(X+offset,Y-offset,text)
	draw_text(X-offset,Y-offset,text)
	draw_set_color(color)
	draw_text(X,Y,text)
	draw_set_color(c_white)
}	

function drawWithBorderExt(X,Y,text,color,OutColor,offset,sep,w){
	draw_set_color(OutColor)
	draw_text_ext(X+offset,Y+offset,text,sep,w)
	draw_text_ext(X-offset,Y+offset,text,sep,w)
	draw_text_ext(X+offset,Y-offset,text,sep,w)
	draw_text_ext(X-offset,Y-offset,text,sep,w)
	draw_set_color(color)
	draw_text_ext(X,Y,text,sep,w)
	draw_set_color(c_white)
}	
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gameStart(_game){
	global.Game = 1
	global.Menu = -1
	_game.starter()
}

function gameEnd(_game){
	global.Game = 0
	_game.ender()
}
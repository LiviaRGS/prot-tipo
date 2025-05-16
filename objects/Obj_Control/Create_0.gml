randomize()
global.Menu = -1
global.End = 0
Old = global.Menu
Created =  []
Passes = []
Input = noone
event = 0
size = 5
depth = -room_height+1
timerswitch = 150
reset = 150

show = []//[text, color]

function cleanShow(){
	while(array_length(show) > 0){
		array_pop(show)	
	}
}

global.Path = "Arquivos/"
command = ""

function Check_Pass(Pass){
	for(var i = 0; i < array_length(Obj_Control.Passes);i++){
		if(Obj_Control.Passes[i] == Pass){
			return true	
		}
	}
	return false
}

Parts = [
//Folder: Type, [[AppNum, Func, Name, Access]], leave event, path, access(0 - > oculto, 1 - > visível, 2 - > NÃO)
//Pass: Type, Password, Text that appears above("Default" = Texto padrão), Reward, Leave event
//Text: Type, Text, Leave event, access(0 - > oculto, 1 - > visível, 2 - > NÃO)
//CMD: Type, Leave event
	/*0*/["Folder",[[1,function(){global.Menu = 1},"Meu Computador",1],[2,function(){
		global.Menu = 3
	},"Ejetável C:",1]], function(){},"Arquivos",1],
	
	/*1*/["Folder",[[5,function(){global.Menu = 0},"Voltar",2],[0,function(){global.Menu = 7},"Estudos - 2001",1]], function(){},"Arquivos/Meu Computador",1],
	
	/*2*/["Text","Algum problema?", function(){
			array_pop(Obj_Control.Parts[0][1])
			array_push(Obj_Control.Parts[1][1],[0,function(){global.Menu = 5},"Jogo",1])
			Parts[5][4] = 1
		},1],
	
	/*3*/["Folder",[[5,function(){global.Menu = 0},"Voltar",2],[0,function(){
		if(Check_Pass(0)){
			global.Menu = 10
		}else{
			global.Menu = 4
		}
	},"Documentos",1]], function(){},"Arquivos/Ejetável C:",1],
	
	/*4*/["Pass","dGP","Default",function(){
		array_push(Passes,0)
		Parts[10][4] = 1
		Parts[14][3] = 1
		global.Menu = 10
	}, function(){if(event == 0){array_push(Obj_Control.Parts[0][1],[4,function(){global.Menu = 2}, "Nota.txt",1]); event = 1}}],
	
	/*5*/["Folder",[[5,function(){global.Menu = 1},"Voltar",2],[4,function(){global.Menu = 6},"Procurando algo?.txt",1]],function(){},"Arquivos/Meu Computador/Jogo",2],
	
	/*6*/["Text","let lista = ['a','B','c','d'];\nlet lista2 = ['F','G','y','l'];\nlista3 = ['o','A','P','w'];\n\nlet senha = lista[3]+lista2[1]+lista3[2];",function(){},2],
	
	/*7*/["Folder",[[5,function(){global.Menu = 1},"Voltar",2],[4,function(){global.Menu = 8},"Variáveis.txt",1],[4,function(){global.Menu = 9},"Vetores.txt",1],[4,function(){global.Menu = 12},"Comandos CMD 1.txt",1]],function(){},"Arquivos/Meu Computador/Estudos - 2001",1],
	
	/*8*/["Text","Variáveis\n\nSão espaços de memória que armazenam valores, são nomeados e o que contêm pode mudar.\n\nComo criar uma variável:\n\n1) var nomedavariavel = 'valor';\n\n2) let nomedavariavel = 'valor';\n\nMudando o valor da variável:\n\nlet numero = 1;\n\nnumero = 2;",function(){},1],
	
	/*9*/["Text","Vetores\n\nSão listas que podem armazenar vários valores.\n\nComo criar um vetor:\n\nlet nomedovetor = ['valor0','valor1'];\n\nChamando o valor de um vetor:\n\nUtilizando o vetor do exemplo:\nnomedovetor[0] -> Chama o primeiro valor.\n\nVETORES COMEÇAM NA POSIÇÃO 0, NÃO 1.",function(){},1],
	
	/*10*/["Folder",[[5,function(){global.Menu = 3},"Voltar",2],[4,function(){global.Menu = 14},"Estranho.txt",1],[4,function(){global.Menu = 11},"Solicitações PlIAGround.txt",0]],function(){},"Arquivos/Ejetável C:/Documentos",2],
	
	/*11*/["Text","Você achou mesmo que iria ser tão fácil?",function(){room_goto(Room2)},2],
	
	/*12*/["Text","Comandos CMD\n\nSe mover:\ncd [caminho]\n\nEx: cd pasta/pasta\n\ncd ../(voltar)\n\nMostrar arquivos:\n\nTodos não ocultos: dir\nTodos: dir /a\nSó ocultos: dir /a:h\n\nPara abrir um arquivo, apenas escreva o seu nome quando estiver na pasta correta.",function(){},1],
	
	/*13*/["CMD",function(){}],
	
	/*14*/["Text","Tem algo faltando, não? Ou será que você apenas não consegue enxergá-lo?",function(){},2],
]

function Clean() {
	while(array_length(Created) > 0){
		instance_destroy(Created[array_length(Created)-1])
		array_pop(Created)
	}
}


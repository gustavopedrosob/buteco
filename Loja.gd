extends Control

var cores = {"preto":"000000","branco":"ffffff","laranja":"bc6500","verde":"207800","azul":"000637","vermelho":"530000","amarelo":"e1be04","roxo":"250026","marrom":"452b12","cinza":"565554"}
var cadeiras = {"c1":"res://sprites/cadeiras/Ativo 1cadeira.png","c2":"res://sprites/cadeiras/Ativo 2cadeira.png","c3":"res://sprites/cadeiras/Ativo 3cadeira.png","c4":"res://sprites/cadeiras/Ativo 4cadeira.png","c5":"res://sprites/cadeiras/Ativo 5cadeira.png","c6":"res://sprites/cadeiras/Ativo 6cadeira.png","c7":"res://sprites/cadeiras/Ativo 7cadeira.png","c8":"res://sprites/cadeiras/Ativo 8cadeira.png","c9":"res://sprites/cadeiras/Ativo 9cadeira.png","c10":"res://sprites/cadeiras/Ativo 10cadeira.png"}
var balcoes = {"b1":"res://sprites/balcoes/Ativo 74buteco.png","b2":"res://sprites/balcoes/Ativo 75buteco.png","b3":"res://sprites/balcoes/Ativo 76buteco.png","b4":"res://sprites/balcoes/Ativo 77buteco.png","b5":"res://sprites/balcoes/Ativo 78buteco.png","b6":"res://sprites/balcoes/Ativo 79buteco.png"}
var lista_botoescores=["Button1","Button2","Button3","Button4","Button5","Button6","Button7","Button8","Button9","Button10"]
var lista_botoescadeira=["Button11","Button12","Button13","Button14","Button15","Button16","Button17","Button18","Button19","Button20"]
var lista_botoesbalcao=["Button21","Button22","Button23","Button24","Button25","Button26"]
var lista_balcoes=["b1","b2","b3","b4","b5","b6"]
var lista_cadeiras=["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10"]
var lista_cores=["verde","azul","vermelho","amarelo","roxo","marrom","cinza","laranja","branco","preto"]
var lista_hboxcor=["1","1","1","1","1","2","2","2","2","2"]
var lista_vboxcor=["1","2","3","4","5","6","7","8","9","10"]
var lista_hboxcadeira=["3","3","3","3","3","4","4","4","4","4"]
var lista_vboxcadeira=["11","12","13","14","15","16","17","18","19","20"]
var lista_hboxbalcao=["5","5","5","5","5","6"]
var lista_vboxbalcao=["21","22","23","24","25","26"] 
var balcao_branco={"br1":"res://sprites/balcoes/Ativo 31buteco.png","br2":"res://sprites/balcoes/Ativo 32buteco.png","br3":"res://sprites/balcoes/Ativo 33buteco.png","br4":"res://sprites/balcoes/Ativo 34buteco.png","br5":"res://sprites/balcoes/Ativo 35buteco.png","br6":"res://sprites/balcoes/Ativo 36buteco.png"}
var balcao_amarelo={"a1":"res://sprites/balcoes/Ativo 37buteco.png","a2":"res://sprites/balcoes/Ativo 38buteco.png","a3":"res://sprites/balcoes/Ativo 39buteco.png","a4":"res://sprites/balcoes/Ativo 40buteco.png","a5":"res://sprites/balcoes/Ativo 41buteco.png","a6":"res://sprites/balcoes/Ativo 42buteco.png"}
var balcao_marrom={"m1":"res://sprites/balcoes/Ativo 43buteco.png","m2":"res://sprites/balcoes/Ativo 44buteco.png","m3":"res://sprites/balcoes/Ativo 45buteco.png","m4":"res://sprites/balcoes/Ativo 46buteco.png","m5":"res://sprites/balcoes/Ativo 47buteco.png","m6":"res://sprites/balcoes/Ativo 48buteco.png"}
var balcao_cinza={"cz1":"res://sprites/balcoes/Ativo 49buteco.png","cz2":"res://sprites/balcoes/Ativo 50buteco.png","cz3":"res://sprites/balcoes/Ativo 51buteco.png","cz4":"res://sprites/balcoes/Ativo 52buteco.png","cz5":"res://sprites/balcoes/Ativo 53buteco.png","cz6":"res://sprites/balcoes/Ativo 54buteco.png"}




func _ready():
	$"HBoxContainer/title".text = Options.lang_content["shop"]
	$"HBoxContainer/HBoxContainer/cadeiras".text = Options.lang_content["chairs"]
	$"HBoxContainer/HBoxContainer/papeis de parede".text = Options.lang_content["wallpapers"]
	$"HBoxContainer/HBoxContainer/balcoes".text = Options.lang_content["kitchen_baltion"]
	load_cores()
	load_cadeiras()
	load_balcoes()

func load_cores():
	for x in range(10):
		Comprado($CenterContainer/wallpaper,$CenterContainer/Chairs,$CenterContainer/balconies,"wallpaper",lista_hboxcor[x],lista_vboxcor[x],lista_cores[x],lista_botoescores[x])

func load_cadeiras():
	for x in range(10):
		Comprado($CenterContainer/Chairs,$CenterContainer/wallpaper,$CenterContainer/balconies,"Chairs",lista_hboxcadeira[x],lista_vboxcadeira[x],lista_cadeiras[x],lista_botoescadeira[x])

func load_balcoes():
	for x in range(6):
		Comprado($CenterContainer/balconies,$CenterContainer/wallpaper,$CenterContainer/Chairs,"balconies",lista_hboxbalcao[x],lista_vboxbalcao[x],lista_balcoes[x],lista_botoesbalcao[x])


func Comprar (tipo,Hbox,num,variavel,numero):
	var caminho = get_node(str("CenterContainer/",tipo,"/HBoxContainer",Hbox,"/VBoxContainer",num,"/Button",num))
	if Playervariables.dinheiro >= 100 and caminho.text=="Comprar":
		Playervariables.dinheiro -= 100
		if $CenterContainer/wallpaper.visible==true:
			Playervariables.loja[variavel]=true
		if $CenterContainer/Chairs.visible==true:
			Playervariables.loja[variavel]=true
		if $CenterContainer/balconies.visible==true:
			Playervariables.loja[variavel]=true
		caminho.text="Equipar"
	if $CenterContainer/wallpaper.visible==true and caminho.text=="Equipar":
		get_parent().get_node(NodePath("Bar/fundo")).modulate=Color(cores[variavel])
	if $CenterContainer/Chairs.visible==true and caminho.text=="Equipar":
		get_parent().get_node(NodePath("Bar/Cadeiras")).atualizar_cadeiras(cadeiras[variavel])
		var caminhocorc = get_node(str("CenterContainer/Chairs/HBoxContainer",Hbox,"/VBoxContainer",num,"/Ativo/cores",numero))
		caminhocorc.visible=true
	if $CenterContainer/balconies.visible==true and caminho.text=="Equipar":
		get_parent().get_node(NodePath("Bar/Balcao")).texture=load(balcoes[variavel])
		var caminhocor = get_node(str("CenterContainer/balconies/HBoxContainer",Hbox,"/VBoxContainer",num,"/Ativo /cores",numero))
		caminhocor.visible=true
	elif Playervariables.dinheiro < 100 and caminho.text=="Comprar":
		$"mensagem de erro".visible=true
func Comprado(no,no2,no3,tipo,dor,num,variavel,botao):
	no.visible=true
	no2.visible=false
	no3.visible=false
	if no.visible==true:
		no2.visible=false
		no3.visible=false
	var coisa = get_node(str("CenterContainer/",tipo,"/HBoxContainer",dor,"/VBoxContainer",num,"/",botao))
	if Playervariables.loja[variavel] == true:
		coisa.text = "Equipar"
	if Playervariables.loja[variavel] == false:
		coisa.text = "Comprar"


func _on_Button1_pressed():
	Comprar("wallpaper","1","1","verde",".")
#esverdeada = ["botao1","verde"]


func _on_Button2_pressed():
	Comprar("wallpaper","1","2","azul",".")
#azul = ["botao2","azul"]


func _on_Button3_pressed():
	Comprar("wallpaper","1","3","vermelho",".")
#vermelho = ["botao3","vermelho"]


func _on_Button4_pressed():
	Comprar("wallpaper","1","4","amarelo",".")
#amarelo = ["botao4","amarelo"]


func _on_Button5_pressed():
	Comprar("wallpaper","1","5","roxo",".")
#roxo = ["botao5","roxo"]


func _on_Button6_pressed():
	Comprar("wallpaper","2","6","preto",".")
#preto= ["botao6","preto"]


func _on_Button7_pressed():
	Comprar("wallpaper","2","7","branco",".")
#branco = ["botao7","branco"]


func _on_Button8_pressed():
	Comprar("wallpaper","2","8","laranja",".")
#laranja = ["botao8","laranja"]


func _on_Button9_pressed():
	Comprar("wallpaper","2","9","cinza",".")
#cinze = ["botao9","cinza"]


func _on_Button10_pressed():
	Comprar("wallpaper","2","10","marrom",".")
#marrom = ["botao10","marrom"]


func _on_Button11_pressed():
	Comprar("Chairs","3","11","c1","1")


func _on_Button12_pressed():
	Comprar("Chairs","3","12","c2","2")


func _on_Button13_pressed():
	Comprar("Chairs","3","13","c3","3")


func _on_Button14_pressed():
	Comprar("Chairs","3","14","c4","4")


func _on_Button15_pressed():
	Comprar("Chairs","3","15","c5","5")


func _on_Button16_pressed():
	Comprar("Chairs","4","16","c6","6")


func _on_Button17_pressed():
	Comprar("Chairs","4","17","c7","7")

func _on_Button18_pressed():
	Comprar("Chairs","4","18","c8","8")


func _on_Button19_pressed():
	Comprar("Chairs","4","19","c9","9")


func _on_Button20_pressed():
	Comprar("Chairs","4","20","c10","10")


func _on_Button21_pressed():
	Comprar("balconies","5","21","b1","1")


func _on_Button22_pressed():
	Comprar("balconies","5","22","b2","2")


func _on_Button23_pressed():
	Comprar("balconies","5","23","b3","3")

func _on_Button24_pressed():
	Comprar("balconies","5","24","b4","4")


func _on_Button25_pressed():
	Comprar("balconies","5","25","b5","5")


func _on_Button26_pressed():
	Comprar("balconies","6","26","b6","6")




func _on_quit_pressed():
	visible=false
	get_tree().paused=false


func _on_papeis_de_parede_pressed():
	load_cores()


func _on_cadeiras_pressed():
	load_cadeiras()


func _on_balcoes_pressed():
	load_balcoes()


func _on_Timer_timeout():
	$"mensagem de erro".visible=false





func _on_Button_pressed():
	visible=false


func _on_Buttoncor1_pressed():
	cores(balcoes,"b1")


func _on_Buttoncor2_pressed():
	cores(balcao_branco,"br1")


func _on_Buttoncor3_pressed():
	cores(balcao_marrom,"m1")


func _on_Buttoncor4_pressed():
	cores(balcao_amarelo,"a1")

func _on_Buttoncor5_pressed():
	cores(balcao_cinza,"cz1")


func _on_Buttoncor6_pressed():
	cores(balcoes,"b2")


func _on_Buttoncor7_pressed():
	cores(balcao_branco,"br2")


func _on_Buttoncor8_pressed():
	cores(balcao_marrom,"m2")


func _on_Buttoncor9_pressed():
	cores(balcao_amarelo,"a2")

func _on_Buttoncor10_pressed():
	cores(balcao_cinza,"cz2")


func _on_Buttoncor11_pressed():
	cores(balcoes,"b3")

func _on_Buttoncor12_pressed():
	cores(balcao_branco,"br3")


func _on_Buttoncor13_pressed():
	cores(balcao_marrom,"m3")

func _on_Buttoncor14_pressed():
	cores(balcao_amarelo,"a3")


func _on_Buttoncor15_pressed():
	cores(balcao_cinza,"cz3")


func _on_Buttoncor16_pressed():
	cores(balcoes,"b4")

func _on_Buttoncor17_pressed():
	cores(balcao_branco,"br4")


func _on_Buttoncor18_pressed():
	cores(balcao_marrom,"m4")


func _on_Buttoncor19_pressed():
	cores(balcao_amarelo,"a4")

func _on_Buttoncor20_pressed():
	cores(balcao_cinza,"cz4")


func _on_Buttoncor21_pressed():
	cores(balcoes,"b5")


func _on_Buttoncor22_pressed():
	cores(balcao_branco,"br5")


func _on_Buttoncor23_pressed():
	cores(balcao_marrom,"m5")


func _on_Buttoncor24_pressed():
	cores(balcao_amarelo,"a5")

func _on_Buttoncor25_pressed():
	cores(balcao_cinza,"cz5")


func _on_Buttoncor26_pressed():
	cores(balcoes,"b6")


func _on_Buttoncor27_pressed():
	cores(balcao_branco,"br6")


func _on_Buttoncor28_pressed():
	cores(balcao_marrom,"m6")


func _on_Buttoncor29_pressed():
	cores(balcao_amarelo,"a6")

func _on_Buttoncor30_pressed():
	cores(balcao_cinza,"cz6")

func cores(cor,variavel):
	get_parent().get_node(NodePath("Bar/Balcao")).texture=load(cor[variavel])


func _on_Buttoncorc1_pressed():
	corc("#44372d")


func _on_Buttoncorc2_pressed():
	corc("ffffff")


func _on_Buttoncorc3_pressed():
	corc("7f5e47")


func _on_Buttoncorc4_pressed():
	corc("ffcd90")


func corc(cor):
	get_parent().get_node(NodePath("Bar/Cadeiras")).trocar_cor(cor)


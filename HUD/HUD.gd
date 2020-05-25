extends Node2D

var Current_Stage; #Guarda o Mapa
var Mini_Map;      #Guarda o Minimapa

func _ready():
	Stage_Selector();
	Active_Map();

func _physics_process(delta):
	delta * 0.1;
	pass;

#Ativa o Estágio:
func Active_Map():
	$Mapa/Mapa/Viewport/Fase/.add_child(Current_Stage);    #Ativa Mapa
	$Mini_Map/Mini_Map/Viewport/Mapa.add_child(Mini_Map);  #Ativa Minimapa

#Seleção de Estágio:
func Stage_Selector():
	
#Template:
	if Global.Template_ON == true:
		Current_Stage = Global.Template_RES.instance();
		Mini_Map = Global.Template_RES.instance();

#Ynar:
	if Global.Ynar_ON == true:
		Current_Stage = Global.Ynar_RES.instance();
		Mini_Map = Global.Ynar_RES.instance();

#Uro:
	if Global.Uro_ON == true:
		Current_Stage = Global.Uro_RES.instance();
		Mini_Map = Global.Uro_RES.instance();

#Inomo:
	if Global.Inomo_ON == true:
		Current_Stage = Global.Inomo_RES.instance();
		Mini_Map = Global.Inomo_RES.instance();

#Emer:
	if Global.Emer_ON == true:
		Current_Stage = Global.Emer_RES.instance();
		Mini_Map = Global.Emer_RES.instance();

#Kons:
	if Global.Kons_ON == true:
		Current_Stage = Global.Kons_RES.instance();
		Mini_Map = Global.Kons_RES.instance();

#Totsu:
	if Global.Totsu_ON == true:
		Current_Stage = Global.Niber_RES.instance();
		Mini_Map = Global.Niber_RES.instance();

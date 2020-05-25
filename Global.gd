extends Node


#Referente ao Player:
onready var Player;
onready var Player_RES = preload("res://Scenes/Player/Player.tscn");
onready var Player_last_position = Vector2();

#Referente ao Nyer Form:
var Nyer = false;
var Nyer_USES = 3;
var Nyer_Charge_Time;
onready var Nyer_Form = preload("res://Scenes/Player/Nyer.tscn");

#Referente a Vayz Power:
var Vayz = false;
var Vayz_ON = false;
var Vayz_USES = 3;
var Vayz_FINISHED = false;
var Vayz_TIMEOUT;

#Referente aos Stages:
onready var Template_RES = preload("res://Scenes/Places/Template/Map_TEMPLATE.tscn");
var Template_ON = true;
var Template_MAP;

var Ynar_RES;
var Ynar_ON = false;

var Uro_RES;
var Uro_ON = false;

var Inomo_RES;
var Inomo_ON = false;

var Emer_RES;
var Emer_ON = false;

var Kons_RES;
var Kons_ON = false;

var Totsu_RES;
var Totsu_ON = false;

var Niber_RES;
var Niber_ON = false;

#Referente aos Sets:
var Ukon_Set = true;
var Ukon_Set_Hair = false;
var Ukon_Set_Top = false;
var Ukon_Set_Leg = false;
var Ukon_Set_Hand = true;
var Ukon_Set_Boot = true;

var Uko_Set = true;
var Uko_Set_Hair = true;
var Uko_Set_Top = true;
var Uko_Set_Leg = true;
var Uko_Set_Hand = false;
var Uko_Set_Boot = false;


#NPCs:

var Ada;

#Others:
onready var Poop = preload("res://Scenes/Others/Poop.tscn");



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

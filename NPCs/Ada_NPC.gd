extends KinematicBody2D

const SPEED = 15;           #Velocidade padrão
const MAX_SPEED = 150;      #Velocidade máxima padrão
const FRICTION = 0.5;       #Fricção

var motion = Vector2();

signal animate;             #Manda sinal para animação 

func _physics_process(delta):
	move_and_slide(motion);

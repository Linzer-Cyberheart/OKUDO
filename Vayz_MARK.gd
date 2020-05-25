extends KinematicBody2D

var starting_position; 

const SPEED = 3000;           #Velocidade padrão
const MAX_SPEED = 6000;      #Velocidade máxima padrão
const FRICTION = 0.5;       #Fricção

var motion = Vector2();

func _physics_process(delta):
	update_move();
	move_and_slide(motion);
	_reset_position();

func _ready():
	starting_position = get_node(".").position;

#Controle da Vayz Mark:
func update_move():
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED);
	elif Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0);
	else:
		motion.y = lerp(motion.y, 0, FRICTION);

	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0);
	elif Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED);
	else:
		motion.x = lerp(motion.x, 0, FRICTION);

func _reset_position():
	if Global.Vayz_ON == false:
		set_position(starting_position);

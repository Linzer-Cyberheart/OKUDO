extends KinematicBody2D

const SPEED = 15;           #Velocidade padrão
const MAX_SPEED = 150;      #Velocidade máxima padrão
const FRICTION = 0.5;       #Fricção

var motion = Vector2();
var Nyer_Form_Charge_OFF = false;

signal animate;             #Manda sinal para animação 

func _ready():
	Global.Player = self;

func _physics_process(delta):
	update_move();
	move_and_slide(motion);
	animate();
	set_armor();
	_nyer_form_charge();
	_teleport();
	_vayz_eyes();

#Teleporte:
func _teleport():
	if Global.Vayz_FINISHED == true:
		set_position(get_node("Vayz/Teleport_Mark/KinematicBody2D").get_global_position());
		Global.Vayz_FINISHED = false;
func _vayz_eyes():
	if Global.Vayz_ON == true:
		$Eyes.frame = 0;

#Função para movimentos básicos de locomoção:
func update_move():
	if Global.Nyer == false:
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
	else:
		_Nyer_Form();
	
	if Global.Vayz_ON == true:
		motion.y = 0;
		motion.x = 0;
	
	#Ativação de Nyer Form:
	if Input.is_action_just_pressed("NYER_FORM") and Global.Nyer == false and Global.Nyer_USES >= 1:
		Global.Nyer = true;
		Global.Nyer_USES -= 1;
		$Nyer_Form_TIMER.start();
		$".".add_child(Global.Nyer_Form.instance());
		#Global.Nyer_Form.set_position(get_node("Global.Template_RES).get_global_position());
		#Global.Nyer_Form.position = get_node("Position2D").position;
		#$"Position2D".add_child(Global.Nyer_Form);

func _nyer_form_charge():
	Global.Nyer_Charge_Time = $Nyer_Form_Charge_TIMER.time_left;
	if Global.Nyer_USES < 3 and Nyer_Form_Charge_OFF == false:
		Nyer_Form_Charge_OFF = true;
		$Nyer_Form_Charge_TIMER.start();

func _on_Nyer_Form_Charge_TIMER_timeout():
	Global.Nyer_USES += 0.5;
	Nyer_Form_Charge_OFF = false;

func _Nyer_Form():

	#Invisível:
	$Sprite.visible = false;
	$Hair.visible = false;
	$Leg.visible = false;
	$Hand.visible = false;
	$Boot.visible = false;
	$Top.visible = false;
	$Shadow.visible = false;
	
	#Locomoção:
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		motion.y = clamp(motion.y + 50*SPEED, 0, 50*MAX_SPEED);
	elif Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		motion.y = clamp(motion.y - 50*SPEED, 50*-MAX_SPEED, 0);
	else:
		motion.y = lerp(motion.y, 0, FRICTION);

	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		motion.x = clamp(motion.x - 50*SPEED, 50*-MAX_SPEED, 0);
	elif Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		motion.x = clamp(motion.x + 50*SPEED, 0, 50*MAX_SPEED);
	else:
		motion.x = lerp(motion.x, 0, FRICTION);

func _on_Nyer_Form_TIMER_timeout():
	Global.Nyer = false;
	
	#Visível
	$Sprite.visible = true;
	$Hair.visible = true;
	$Leg.visible = true;
	$Hand.visible = true;
	$Boot.visible = true;
	$Top.visible = true;
	$Shadow.visible = true;

#Função que cria sinal para animar:
func animate():
	emit_signal("animate", motion);
	
#Last Player position saved:
func _on_Save_Last_Position_TIMER_timeout():
	Global.Player_last_position = get_node(".").get_global_position();

#Organização de Sets:
func set_armor():
#Ukon:-------------------------------------------------------------------------:
	if Global.Ukon_Set == true:
		if Global.Ukon_Set_Hair == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Hair.animation = "Ukon:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Hair.animation = "Ukon:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Hair.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Hair.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Hair.animation = "Ukon:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Hair.animation = "Ukon:Back";

		if Global.Ukon_Set_Top == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Top.animation  = "Ukon:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Top.animation  = "Ukon:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Top.animation  = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Top.animation  = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Top.animation  = "Ukon:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Top.animation  = "Ukon:Back";

		if Global.Ukon_Set_Leg == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Leg.animation  = "Ukon:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Leg.animation  = "Ukon:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Leg.animation  = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Leg.animation  = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Leg.animation  = "Ukon:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Leg.animation  = "Ukon:Back";

		if Global.Ukon_Set_Hand == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Hand.animation = "Ukon:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Hand.animation = "Ukon:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Hand.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Hand.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Hand.animation = "Ukon:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Hand.animation = "Ukon:Back";

		if Global.Ukon_Set_Boot == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Boot.animation = "Ukon:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Boot.animation = "Ukon:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Boot.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Boot.animation = "Ukon:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Boot.animation = "Ukon:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Boot.animation = "Ukon:Back";

#Uko---------------------------------------------------------------------------:
	if Global.Uko_Set == true:
		if Global.Uko_Set_Hair == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Hair.animation = "Uko:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Hair.animation = "Uko:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Hair.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Hair.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Hair.animation = "Uko:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Hair.animation = "Uko:Back";

		if Global.Uko_Set_Top == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Top.animation  = "Uko:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Top.animation  = "Uko:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Top.animation  = "Uko:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Top.animation  = "Uko:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Top.animation  = "Uko:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Top.animation  = "Uko:Back";

		if Global.Uko_Set_Leg == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Leg.animation  = "Uko:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Leg.animation  = "Uko:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Leg.animation  = "Uko:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Leg.animation  = "Uko:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Leg.animation  = "Uko:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Leg.animation  = "Uko:Back";

		if Global.Uko_Set_Hand == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Hand.animation = "Uko:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Hand.animation = "Uko:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Hand.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Hand.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Hand.animation = "Uko:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Hand.animation = "Uko:Back";

		if Global.Uko_Set_Boot == true:
			if $AnimationPlayer.current_animation == "Run_Front":
				$Boot.animation = "Uko:Run_Front";
			if $AnimationPlayer.current_animation == "Run_Back":
				$Boot.animation = "Uko:Run_Back";
			if $AnimationPlayer.current_animation == "Run_Right":
				$Boot.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Run_Left":
				$Boot.animation = "Uko:Run";
			if $AnimationPlayer.current_animation == "Idle_Front":
				$Boot.animation = "Uko:Front";
			if $AnimationPlayer.current_animation == "Idle_Back":
				$Boot.animation = "Uko:Back";

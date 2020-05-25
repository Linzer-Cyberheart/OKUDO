extends AnimationPlayer

#Animações de movimentos:
func _on_Player_animate(motion):

#Movimentos básicos para mover-se:
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		play("Run_Front");
	elif Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		play("Run_Back");

	elif Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		play("Run_Left");
	elif Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		play("Run_Right");

	elif Input.is_action_pressed("UP") and Input.is_action_pressed("RIGHT"):
		play("Run_Right");
	elif Input.is_action_pressed("UP") and Input.is_action_pressed("LEFT"):
		play("Run_Left");
	elif Input.is_action_pressed("DOWN") and Input.is_action_pressed("RIGHT"):
		play("Run_Right");
	elif Input.is_action_pressed("DOWN") and Input.is_action_pressed("LEFT"):
		play("Run_Left");

	elif Input.is_action_pressed("UP") and Input.is_action_pressed("DOWN"):
		play("Idle_Front");
	elif Input.is_action_pressed("DOWN") and Input.is_action_pressed("UP"):
		play("Idle_Back");
	elif Input.is_action_pressed("RIGHT") and Input.is_action_pressed("LEFT"):
		play("Idle_Front");
	elif Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		play("Idle_Front");


	if Input.is_action_just_released("UP"):
		play("Idle_Back");
	elif Input.is_action_just_released("DOWN"):
		play("Idle_Front");
	elif Input.is_action_just_released("UP") and Input.is_action_just_released("LEFT"):
		play("Idle_Back");
	elif Input.is_action_just_released("UP") and Input.is_action_just_released("RIGHT"):
		play("Idle_Back");
	elif Input.is_action_just_released("DOWN") and Input.is_action_just_released("LEFT"):
		play("Idle_Front");
	elif Input.is_action_just_released("DOWN") and Input.is_action_just_released("RIGHT"):
		play("Idle_Front");
	elif (Input.is_action_just_released("RIGHT") or Input.is_action_just_released("LEFT")) and not (Input.is_action_pressed("UP") or Input.is_action_pressed("DOWN")):
		play("Idle_Front");

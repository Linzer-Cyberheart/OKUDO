extends Node2D

var on;
func _process(delta):
	delta * 0.1;
	$Teleport_Mark/KinematicBody2D/Bar/TextureProgress.value = $Vayz_Timer/Timer.time_left;

func _Vayz_Mode():
	if on == true:
		$Vayz_Timer/Timer.start();
		$".".show();
		Engine.time_scale = 0.1;
		Global.Vayz_ON = true;
		$Wind/AnimationPlayer.play("Wind_Atract");

	if on == false:
		$".".hide();
		Engine.time_scale = 1;
		Global.Vayz_ON = false;
		Global.Vayz_FINISHED = true;
		$Vayz_Timer/Timer.stop();


#Ativação do Vayz Mode:
func _input(event):
	if Input.is_action_just_pressed("VAYZ_MODE"):
		on = !on;
		_Vayz_Mode();


#Término do Vayz Mode:
func _on_Timer_timeout():
	$".".hide();
	Engine.time_scale = 1;
	Global.Vayz_ON = false;
	on = !on

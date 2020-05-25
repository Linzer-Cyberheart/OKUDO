extends Node2D

func _physics_process(delta):
	delta * 0.1;
	Vayz_Effect();

#Vayz_Effect:
func Vayz_Effect():
	if Global.Vayz_ON == true:
		show();
	else:
		hide();

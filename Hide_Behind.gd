extends Node2D


#Pondo valor Incial:
func _ready():
	$Sprite.z_index = 1;
	$".".z_index = 1;

func _on_Area2D_body_entered(body):   #Esconde
	if body.is_in_group("Invisible_Hand"):
		$Sprite.z_index = 20;
		$".".z_index = 20;

func _on_Area2D_body_exited(body):    #Não Esconde
	if body.is_in_group("Invisible_Hand"):
		$Sprite.z_index = 1;
		$".".z_index = 1;

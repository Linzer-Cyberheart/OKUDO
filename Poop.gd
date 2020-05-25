extends Node2D

var smashed = false;

func _on_Area2D_body_entered(body):
	if smashed == false:
		$AnimatedSprite.animation = "Smashed";
		$Pieces.show();
		$Smelly.show();
		smashed == true;

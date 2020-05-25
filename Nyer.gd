extends Node2D

func _process(delta):
	if Global.Nyer == true:
		$AnimatedSprite.show();
		$AnimatedSprite.play();
		$Particles2D.visible = true;

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop();
	$AnimatedSprite.hide();
	$Particles2D.visible = false;


extends Node2D

func _process(delta):
	$Nyer_BAR.value = Global.Nyer_Charge_Time *3;

	if Global.Nyer_USES == 3:
		$Light2D_USES_1.visible = true;
		$Light2D_USES_2.visible = true;
		$Light2D_USES_3.visible = true;
	elif Global.Nyer_USES == 2:
		$Light2D_USES_1.visible = true;
		$Light2D_USES_2.visible = true;
		$Light2D_USES_3.visible = false;
	elif Global.Nyer_USES == 1:
		$Light2D_USES_1.visible = true
		$Light2D_USES_2.visible = false;
		$Light2D_USES_3.visible = false;
	elif Global.Nyer_USES == 0:
		$Light2D_USES_1.visible = false;
		$Light2D_USES_2.visible = false;
		$Light2D_USES_3.visible = false;

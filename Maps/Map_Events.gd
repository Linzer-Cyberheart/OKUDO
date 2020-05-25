extends Node2D

func _physics_process(delta):
	if Global.Vayz_FINISHED == true:
		make_poop();

func make_poop():
	var position_ARRAY = [];
	var Obj_ARRAY = [];
	position_ARRAY.append(get_node("Player").position);
	var size = position_ARRAY.size();
	
	for x in range(0, size):
		if Obj_ARRAY.size() <= x:
			var obj = Global.Poop.instance();
			obj.position = position_ARRAY[x];
			add_child(obj);
			Obj_ARRAY.append(obj);

		elif Obj_ARRAY[x] == null:
			var obj = Global.Poop.instance();
			obj.position = position_ARRAY[x];
			add_child(obj);
			Obj_ARRAY.append(obj);

extends Node

signal finished_state(newState);


func start():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Idle_Left");
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Idle_Right");

func manager_input(event):
	pass;

func update(delta):
	if owner.is_on_floor():
		if owner.direction.x:
			emit_signal("finished_state", "Move");

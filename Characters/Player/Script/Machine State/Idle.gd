extends Node

signal finished_state(newState);


func start():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Idle_Left");
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Idle_Right");


func manager_input(event):
	if Input.is_action_pressed("ui_jump"):
		emit_signal("finished_state", "Jump");

func update(delta):
	owner.velocity.x = 0;
	owner.move_and_slide(owner.velocity, owner.normalFloor);
	
	
	if owner.is_on_floor():
		if owner.direction.x:
			emit_signal("finished_state", "Move");

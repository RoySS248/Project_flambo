extends Node

signal finished_state(newState);


func start():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Idle_Left");#Fall_Left
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Idle_Right");#Fall_Right

func manager_input(event):
	pass;

func update(delta):
	if owner.is_on_floor():
		emit_signal("finished_state", "Idle");
	
	if owner.direction.x:
		move(owner.SPEED, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);

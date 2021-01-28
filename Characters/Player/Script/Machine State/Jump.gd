extends Node

signal finished_state(newState);


func start():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Idle_Left");#Jump_Left
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Idle_Right");#Jump_Right
	
	owner.velocity.y = -owner.JUMP_SPEED;
	owner.move_and_slide(owner.velocity, owner.normalFloor);

func manager_input(event):
	pass;

func update(delta):
	print(owner.velocity.y);
	if owner.velocity.y >= 0:
		emit_signal("finished_state", "Fall");

	if owner.is_on_floor():
		emit_signal("finished_state", "Idle");
		return;

	move(owner.SPEED,owner.direction);

func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);


extends Node

signal finished_state(newState);


func start():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Move_Left");
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Move_Right");


func manager_input(event):
	if Input.is_action_pressed("ui_jump"):
		emit_signal("finished_state", "Jump");


func update(delta):
	if owner.direction.x == 0:
		emit_signal("finished_state", "Idle");
	
	if owner.direction.x:
		move(owner.SPEED, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);

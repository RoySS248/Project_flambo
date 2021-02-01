extends Node

signal finished_state(newState);


func start():
	manager_animation();
	owner.velocity.y = -owner.JUMP_SPEED;
	owner.move_and_slide(owner.velocity, owner.normalFloor);


func manager_animation():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Jump_Left");
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Jump_Right");


func manager_input(event):
	if Input.is_action_just_pressed("ui_attack"):
		emit_signal("finished_state", "AttackJump");


func update(delta):
	
	manager_animation();
	if owner.velocity.y >= 0:
		emit_signal("finished_state", "Fall");
	
	if owner.is_on_floor():
		emit_signal("finished_state", "Idle");
		return;
	
	move(owner.SPEED,owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);


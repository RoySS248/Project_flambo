extends Node

signal finished_state(newState);


func start():
	manager_animation();


func manager_animation():
	if owner.direction.x == -1:
		owner.get_node("AnimationPlayer").play("Move_Left");
	elif owner.direction.x == 1:
		owner.get_node("AnimationPlayer").play("Move_Right");


func manager_input(event):
	if Input.is_action_just_pressed("ui_jump"):
		emit_signal("finished_state", "Jump");
		
	if Input.is_action_just_pressed("ui_attack"):
		emit_signal("finished_state", "Attack");

	if Input.is_action_just_pressed("ui_special"):
		emit_signal("finished_state", "SpecialFlame")


func update(delta):
	manager_animation();
	if owner.direction.x == 0:
		emit_signal("finished_state", "Idle");
	
	if owner.direction.x:
		move(owner.SPEED, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);

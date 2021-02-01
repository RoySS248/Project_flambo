extends Node

signal finished_state(newState);


func start():
	manager_animation();


func manager_animation():
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Idle_Left");
	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Idle_Right");


func manager_input(event):
	if Input.is_action_just_pressed("ui_jump"):
		emit_signal("finished_state", "Jump");
	
	if Input.is_action_just_pressed("ui_attack"):
		emit_signal("finished_state", "Attack");
	
	if Input.is_action_just_pressed("ui_special"):
	
		if Input.is_action_pressed("ui_up"):
			emit_signal("finished_state", "SpecialCatapult");
		else: 
			emit_signal("finished_state", "SpecialFlame");


func update(delta):
	owner.velocity.x = 0;
	owner.move_and_slide(owner.velocity, owner.normalFloor);
	
	if owner.velocity.y > 0 && !owner.inGround:
		emit_signal("finished_state", "Fall");
	
	if owner.is_on_floor() || owner.inGround:
		if owner.direction.x:
			emit_signal("finished_state", "Move");

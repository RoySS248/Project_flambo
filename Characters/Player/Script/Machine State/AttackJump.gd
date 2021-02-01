extends Node

signal finished_state(newState);

var damage: int = 1;


func start():
	manager_animation();


func manager_animation():
	owner.controlSpriteDirection = false;
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play("Attack_2_Left");

	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play("Attack_2_Right");



func update(delta):
	move(owner.SPEED, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);



func manager_input(event):
	pass;


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack_1_Right" || anim_name == "Attack_2_Right" || anim_name == "Attack_1_Left" || anim_name == "Attack_2_Left":
		owner.controlSpriteDirection = true;
		emit_signal("finished_state","Fall");

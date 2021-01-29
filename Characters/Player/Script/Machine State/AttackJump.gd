extends Node

signal finished_state(newState);

var damage: int = 1;


func start():
	owner.get_node("AnimationPlayer").play("Attack2");

func update(delta):
	move(owner.SPEED, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, owner.normalFloor);



func manager_input(event):
	pass;


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Attack1" || anim_name == "Attack2":
		emit_signal("finished_state","Fall");

extends Node

signal finished_state(newState);

var hit: bool = false;
var damage: int = 1;
var hit_count: int = 0;
var max_hit: int = 3;


func start():
	attack();


func manager_input(event):
	if Input.is_action_just_pressed("ui_attack") and hit_count < max_hit:
		hit = true;


func update(delta):
	pass;


func attack():
	if hit_count == 0 || hit_count == 1:
		owner.get_node("AnimationPlayer").play("Attack1");
	elif hit_count == 2 || hit_count == 3:
		owner.get_node("AnimationPlayer").play("Attack2");
		
	hit = false;


func _on_AnimationPlayer_animation_finished(anim_name):
	if hit:
		hit_count += 1;
		attack();
		return;
	
	if anim_name == "Attack1" || anim_name == "Attack2":
		hit_count = 0
		hit = false
		emit_signal("finished_state","Idle");

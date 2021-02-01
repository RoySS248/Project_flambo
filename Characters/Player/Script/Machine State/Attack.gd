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
		manager_animation("Attack_1_");
	elif hit_count == 2 || hit_count == 3:
		manager_animation("Attack_2_");
		
	hit = false;


func manager_animation(anim : String):
	owner.controlSpriteDirection = false;
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play(str(anim) + "Left");

	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play(str(anim) + "Right");



func _on_AnimationPlayer_animation_finished(anim_name):
	if hit:
		hit_count += 1;
		attack();
		return;
	
	if anim_name == "Attack_1_Right" || anim_name == "Attack_2_Right" || anim_name == "Attack_1_Left" || anim_name == "Attack_2_Left":
		hit_count = 0;
		hit = false;
		owner.controlSpriteDirection = true;
		emit_signal("finished_state","Idle");

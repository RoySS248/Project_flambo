extends Node

signal finished_state(newState);

onready var posFlame= owner.get_node("PositionPlayer/PositionFlame");
var flame = load("res://Characters/Player/Assets/Special/Flame.tscn");
var damage: int = 2;



func start():
	owner.controlSpriteDirection = false;
	owner.get_node("AnimationPlayer").play("SpecialFlame");#SpecialFlame
	posFlame.add_child(flame.instance());


func update(delta):
	owner.velocity.x = 0;
	owner.move_and_slide(owner.velocity, owner.normalFloor);


func manager_input(event):
	pass;


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "SpecialFlame":#SpecialFlame
		posFlame.get_child(0).queue_free();
		owner.controlSpriteDirection = true;
		emit_signal("finished_state","Idle");

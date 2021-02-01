extends Node

signal finished_state(newState);

onready var posFlame= owner.get_node("PositionPlayer/PositionCatapult");
var flame = load("res://Characters/Player/Assets/Special/Flame.tscn");
var damage: int = 2;



func start():
	owner.controlSpriteDirection = false;
	manager_animation("Special_Catapult_");
	posFlame.add_child(flame.instance());


func manager_animation(anim : String):
	if owner.viewDirection == "left":
		owner.get_node("AnimationPlayer").play(str(anim) + "Left");

	elif owner.viewDirection == "right":
		owner.get_node("AnimationPlayer").play(str(anim) + "Right");


func update(delta):
	owner.velocity.x = 0;
	owner.move_and_slide(owner.velocity, owner.normalFloor);


func manager_input(event):
	pass;


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Special_Cataputl_Right" || anim_name == "Special_Cataputl_Left":
		posFlame.get_child(0).queue_free();
		owner.controlSpriteDirection = true;
		emit_signal("finished_state","Idle");

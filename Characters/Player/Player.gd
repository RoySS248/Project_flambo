extends KinematicBody2D


# Declare member variables here. Examples:
export (int) var speed = 1;
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle_Right");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("M_right"):
		MoveRight();
	elif Input.is_action_pressed("M_left"):
		MoveLeft();
	else:
		$AnimationPlayer.play("Idle_Right");


func MoveRight():
	$AnimationPlayer.play("Move_Right");
	position.x+=speed;

func MoveLeft():
	$AnimationPlayer.play("Move_Left");
	position.x-=speed;

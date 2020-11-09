extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 45;
export var gravity = 500;
var velocity = Vector2(0,0);
var direccion = Vector2(0,0);
var normal = Vector2(0,-1);
var State=0;


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle_Right");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass
		
func _input(delta):
	direccion.x=int(Input.is_action_pressed("M_right"))-int(Input.is_action_pressed("M_left"));
	if direccion.x != 0:
		#$Position2D.scale=Vector2(direccion.x,1);
		if direccion.x == 1:
			State=1;
			$AnimationPlayer.play("Move_Right");
		elif direccion.x == -1:
			State=-1;
			$AnimationPlayer.play("Move_Left");
	else:
		if State==1:
			$AnimationPlayer.play("Idle_Right");
		else:
			$AnimationPlayer.play("Idle_Left");
		

func _physics_process(delta):
	AplicarGravedad(delta);
	Move();
		

func Move():
	velocity.x=direccion.x*speed;
	move_and_slide(velocity,normal);
	#$AnimationPlayer.play("Move_Right");
	#position.x+=speed;

func AplicarGravedad(delta):
	velocity.y += gravity * delta;
	move_and_slide(velocity,normal);
	if is_on_floor():
		velocity.y=0;
		#print(velocity.y)

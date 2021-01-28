extends KinematicBody2D

const SPEED : int = 45;
const GRAVITY : int = 500;
const JUMP_SPEED : int = 200;
var velocity : Vector2 = Vector2.ZERO;
var direction : Vector2 = Vector2.ZERO;
var normalFloor : Vector2 = Vector2(0,-1);
var viewDirection : String = "right";


func _input(event):
	if Input.is_action_pressed("ui_right"):
		viewDirection = "right";
	elif Input.is_action_pressed("ui_left"):
		viewDirection = "left";
	
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"));
	
	if direction.x !=0:
		$PositionPlayer.scale = Vector2(direction.x, 1);

func _physics_process(delta):
	apply_gravity(delta)

 
func apply_gravity(delta):
	velocity.y += GRAVITY * delta;
	move_and_slide(velocity,normalFloor);
	
	if is_on_floor():
		velocity.y = 0;

func cancel_velocity():
	velocity = Vector2.ZERO;

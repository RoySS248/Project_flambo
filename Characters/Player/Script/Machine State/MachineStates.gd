extends Node

var states : Dictionary = {};
var currentSate = null;
const initialState = "Idle";

func _ready():
	states = {
		"Idle": $Idle,
		"Move": $Move,
		"Jump": $Jump,
		"Fall": $Fall,
		"Attack": $Attack,
		"AttackJump": $AttackJump,
		"SpecialFlame": $SpecialFlame,
		"SpecialCatapult": $SpecialCatapult
	};

	initialize();


func initialize():
	currentSate = initialState;
	states[currentSate].start();


func change_state(newState:String):
	if newState in [ "Idle","Jump", "Attack","Fall"]:
		owner.cancel_velocity();
	
	currentSate = newState;
	states[currentSate].start();


func _input(event):
	states[currentSate].manager_input(event);


func _physics_process(delta):
	states[currentSate].update(delta);
	owner.get_node("LabelState").text = str(currentSate);

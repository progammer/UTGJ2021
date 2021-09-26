extends KinematicBody

export var max_speed = 12
export var gravity = 70
export var jump_impulse = 25

onready var pivot = $Pivot

var velocity =- Vector3.ZERO

# Direction Handling
const UPRIGHT = 0
const LAYING = 1
const NUM_DIRS = 4

var lay = 0
var dir = 0
const ROTATION_GLYPHS = [
	["u^", "u>", "uv", "u<"],	# standing up 0
	["d^", "d>", "dv", "d<"]	# laying down 1
]
const ROTATIONS = [ # hold info for how to turn
	
]

func _physics_process(delta):
	#print(ROTATION_GLYPHS[lay][dir])

	var movement_vector = get_movement_vector()
	apply_movement(movement_vector)
	
	if movement_vector != Vector3.ZERO:
		pivot.look_at(translation + movement_vector, Vector3.UP)
	handle_rotation()
	handle_jump()
	apply_gravity(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func get_movement_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	return input_vector.normalized()

func handle_rotation():
	# 6 different states. (or 8, if asymmetrical)
	# Standing Up: Facing cam or facing side (or 4 rotation points)
	# Laying Down: 4 rotation points
	var dir_input = 1 if Input.is_action_just_pressed("turn_c") else 0  - 1 if Input.is_action_just_pressed("turn_cc") else 0
	if dir_input != 0:
		# 0 - 1 => 3. -1 mod is like adding mod value - 1
		dir += 1 if dir_input > 0 else (NUM_DIRS - 1)
		dir %= NUM_DIRS
	# Handle laying down or standing up
	if lay == UPRIGHT and Input.is_action_just_pressed("lay_down"):
		# print("bruh")
		lay = LAYING
	elif lay == LAYING and Input.is_action_just_pressed("get_up"):
		lay = UPRIGHT

func apply_movement(input_vector):
	velocity.x = input_vector.x * max_speed
	velocity.z = input_vector.z * max_speed
	
func apply_gravity(delta):
	velocity.y -= gravity * delta

func handle_jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y += jump_impulse
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

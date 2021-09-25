extends KinematicBody

export var max_speed = 12
export var gravity = 70
export var jump_impulse = 25

var velocity =- Vector3.ZERO

func _physics_process(delta):
	var input_vector = get_input_vector()
	apply_movement(input_vector)
	apply_gravity(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	return input_vector.normalized()

func apply_movement(input_vector):
	velocity.x = input_vector.x * max_speed
	velocity.z = input_vector.z * max_speed
	
func apply_gravity(delta):
	velocity.y -= gravity * delta


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


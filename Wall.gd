extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 0.00001
var velocity =- Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x += speed
	velocity = move_and_slide(velocity, Vector3.UP)

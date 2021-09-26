extends Area # which extends Spatial

# Get points based on screen size
func _ready():
	direction = randi() % 4
	# set_monitoring(true)

export var velocity = 0.01
export var direction = 0
const DIRECTIONS = [
	[0, 0, 1], # towards
	[1, 0, 0], # right
	[-1, 0, 0], # left
	[0, -1, 0] # down
]

const OFFSET = [
	# FOR EACH OF THE STARTING DIRECTIONS
	
	
]

# Want to set up area collision
# Want to randomly choose a direction to move in and orient to
# should dynamically spawn and despawn if successfully made to the otherside

func _process(delta):
	translation = Vector3(translation.x + DIRECTIONS[direction][0] * velocity, translation.y + DIRECTIONS[direction][1] * velocity, translation.z + DIRECTIONS[direction][2] * velocity)

func _on_Wall_body_entered(body):
	if "Player" == body.name:
		queue_free()

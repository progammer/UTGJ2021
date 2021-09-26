extends Area # which extends Spatial

# Get points based on screen size
func _ready():
	direction = randi() % 4
	translation += OFFSETS[direction]
	self.look_at(ROTATIONS[direction], Vector3.UP)
	print("spawned" + str(direction))
	# set_monitoring(true)

export var velocity = 0.1
export var direction = 0
const DIRECTIONS = [
	Vector3(0, 0, 1), # towards
	Vector3(1, 0, 0), # right
	Vector3(-1, 0, 0), # left
	Vector3(0, -1, 0) # down
]

const ROTATIONS = [
	Vector3(0, 0, 0),
	Vector3(0, 0, 0),
	Vector3(0, 0, 0),
	Vector3(0, 90, 0)
]

const OFFSETS = [
	# FOR EACH OF THE STARTING DIRECTIONS
	Vector3(0, 0, -10),
	Vector3(-10, 0, 0),
	Vector3(10, 0, 0),
	Vector3(0, 10, 0)
]

# Want to set up area collision
# Want to randomly choose a direction to move in and orient to
# should dynamically spawn and despawn if successfully made to the otherside

func _process(delta):
	translation = translation + DIRECTIONS[direction] * velocity

func _on_Wall_body_entered(body):
	if "Player" == body.name:
		queue_free()

extends Spatial

# Get points based on screen size
func _ready():
	pass

# Want to set up area collision
# Want to randomly choose a direction to move in and orient to
# should dynamically spawn and despawn if successfully made to the otherside

func _process(delta):
	translation = Vector3(translation.x + 0.01, translation.y, translation.z)

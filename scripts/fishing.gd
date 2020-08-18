extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	GV.scene = "fishing"
	GV.fish_remaining = 10
	GV.scene_end = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GV.fish_remaining == 0:
		GV.scene_end = true

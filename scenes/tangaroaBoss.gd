extends Spatial

var central_stopped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hit():
	if !central_stopped:
		$collision.play("collide")
	else:
		central_stopped = false


func _on_centralOrb_shot():
	central_stopped = true

extends Spatial

var firing_amt = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hit():
	if firing_amt != 0:
		$collision.play("collide")
	else:
		firing_amt = 1

func _on_orb_hit():
	firing_amt -= 1

extends Spatial

const FIRING = 3

var firing_amt = FIRING
var rung = 0

func hit():
	rung += 1
	
	if rung == FIRING:
		if firing_amt != 0:
			$collision.play("collide")
			GV.food -= firing_amt * 2
		firing_amt = FIRING
		rung = 0

func _on_orb_hit():
	print("PING")
	firing_amt -= 1

extends Spatial

var firing_amt = 3
var rung = 0

func hit():
	rung += 1
	
	if rung == firing_amt:
		if firing_amt != 0:
			$collision.play("collide")
			GV.food -= firing_amt * 2
		firing_amt = 3
		rung = 0

func _on_orb_hit():
	print("PING")
	firing_amt -= 1

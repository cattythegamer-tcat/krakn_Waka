extends Spatial

var FIRING = 1

var firing_amt = FIRING
var rung = 0

func hit():
	rung += 1
	
	if rung == FIRING:
		if firing_amt != 0:
			$collision.play("collide")
			GV.food -= firing_amt * 2
		else:
			FIRING += 2
			if FIRING == 3:
				$minion_emerge.play("first_level")
			elif FIRING == 5:
				$minion_emerge.play("second_level")
			else:
				$center_beam.queue_free()
				$left_beam.queue_free()
				$right_beam.queue_free()
				$far_left_beam.queue_free()
				$far_right_beam.queue_free()
		firing_amt = FIRING
		rung = 0

func _on_orb_hit():
	print("PING")
	firing_amt -= 1

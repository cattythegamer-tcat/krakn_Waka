extends Spatial

var FIRING = 1

var firing_amt = FIRING
var rung = 0

func _ready():
	GV.scene_end = false

func hit():
	rung += 1
	
	if rung == FIRING:
		if firing_amt > 0:
			$collision.play("collide")
			GV.food -= firing_amt * 2
		else:
			$damage.play("tangaroaDamaged")
			FIRING += 2
			match FIRING:
				3:
					$minion_emerge.play("first_level")
					$bossHealth.text = "Phase 2/4"
				5:
					$minion_emerge.play("second_level")
					$bossHealth.text = "Phase 3/4"
				7:
					$minion_emerge.play("third_level")
					$bossHealth.text = "Phase 4/4"
				_:
					$bossHealth.text = "DEFEATED"
					$center_beam.queue_free()
					$left_beam.queue_free()
					$right_beam.queue_free()
					$far_left_beam.queue_free()
					$far_right_beam.queue_free()
					$super_far_left_beam.queue_free()
					$super_far_right_beam.queue_free()
					$damage.play("dying")
		firing_amt = FIRING
		rung = 0

func _on_orb_hit():
	firing_amt -= 1

func end():
	GV.scene_end = true

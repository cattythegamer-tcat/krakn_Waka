extends Spatial

const DEF_WAIT_TIME = 3
const STARTING_BOSSHEALTH = 80
const DEF_ROTATION = 0.04

var bossHealth = STARTING_BOSSHEALTH
var prevBossHealth = bossHealth
var current = 0
var tentacleShot = false
var sunk = false
var playerTurnEnd = false
var krakenAttack = false
var endEarly = false
var starting_difficulty = 1.0 * GV.global_difficulty
var difficulty = starting_difficulty

onready var krakA = $krakenAnimations

func _ready():
	GV.scene = "octopus"
	GV.scene_end = false
	$tentacleRotation.playback_speed = DEF_ROTATION * difficulty

func _process(delta):
	$bossHealth.text = "Boss Health: " + str(bossHealth - 10)
	if bossHealth <= 10:
		GV.scene_end = true
		GV.food += int(round(rand_range(8, 12)))
	if !krakA.is_playing():
		if playerTurnEnd and !sunk:
			krakA.play("tentacleSink")
			sunk = true
			playerTurnEnd = false
			if tentacleShot:
				krakenAttack = false
			else:
				krakenAttack = true
			tentacleShot = false
		elif sunk:
			if krakenAttack:
				krakA.play("tentacleAttack")
				krakenAttack = false
			else:
				krakA.play_backwards("tentacleSink")
				sunk = false
		elif $playerTurnTimer.is_stopped():
				$playerTurnTimer.wait_time = DEF_WAIT_TIME / (difficulty - 0.5)
				$playerTurnTimer.start()


func bossDoDamage(amt = 10):
	GV.food -= amt

func tentacleKilled(num):
	if !tentacleShot and !sunk:
		print(num)
		difficulty = float(STARTING_BOSSHEALTH) / float(bossHealth) * starting_difficulty
		$tentacleRotation.playback_speed = DEF_ROTATION * difficulty
		bossHealth -= 10
		tentacleShot = true
		endEarly = true
		playerTurnEnd = true
		pass
		if num == 1:
			$krakenAnimations.play("tentacle_1_destroyed")
		elif num == 2:
			$krakenAnimations.play("tentacle_2_destroyed")
		elif num == 3:
			$krakenAnimations.play("tentacle_3_destroyed")
		elif num == 4:
			$krakenAnimations.play("tentacle_4_destroyed")
		elif num == 5:
			$krakenAnimations.play("tentacle_5_destroyed")
		elif num == 6:
			$krakenAnimations.play("tentacle_6_destroyed")
		elif num == 7:
			$krakenAnimations.play("tentacle_7_destroyed")
		elif num == 8:
			$krakenAnimations.play("tentacle_8_destroyed")

func _on_area_1_area_entered(area): tentacleKilled(1)


func _on_area_2_area_entered(area): tentacleKilled(2)


func _on_area_3_area_entered(area): tentacleKilled(3)


func _on_area_4_area_entered(area): tentacleKilled(4)


func _on_area_5_area_entered(area): tentacleKilled(5)


func _on_area_6_area_entered(area): tentacleKilled(6)


func _on_area_7_area_entered(area): tentacleKilled(7)


func _on_area_8_area_entered(area): tentacleKilled(8)


func _on_Timer_timeout():
	print("PING")
	if endEarly:
		endEarly = false
	else:
		playerTurnEnd = true

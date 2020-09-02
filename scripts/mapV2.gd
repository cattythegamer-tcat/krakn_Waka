extends Node2D

onready var levels = ["potato", GV.octopusScene, GV.octopusScene, GV.octopusScene, GV.landScene]

func _ready():
	match GV.playerLocation:
		0:
			$transitionAnimations.play("firstMove")
		1:
			GV.global_difficulty = 3 * GV.difficultyMultipiler
			$transitionAnimations.play("secondMove")
		2:
			GV.global_difficulty = 4 * GV.difficultyMultipiler
			$transitionAnimations.play("thirdMove")
		3:
			GV.global_difficulty = 5 * GV.difficultyMultipiler
			$transitionAnimations.play("fourthMove")

func _process(delta):
	if !$transitionAnimations.is_playing():
		GV.playerLocation += 1
		if GV.playerLocation == 1:
			GV.fishingScene()
		else:
			get_tree().change_scene_to(levels[GV.playerLocation])

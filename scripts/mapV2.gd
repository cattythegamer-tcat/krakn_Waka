extends Node2D

onready var levels = ["potato", GV.octopusScene, GV.octopusScene, GV.octopusScene, GV.landScene]

func _ready():
	if GV.playerLocation == 0:
		$transitionAnimations.play("firstMove")
	elif GV.playerLocation == 1:
		GV.global_difficulty = 3
		$transitionAnimations.play("secondMove")
	elif GV.playerLocation == 2:
		GV.global_difficulty = 4
		$transitionAnimations.play("thirdMove")
	elif GV.playerLocation == 3:
		GV.global_difficulty = 5 
		$transitionAnimations.play("fourthMove")

func _process(delta):
	if !$transitionAnimations.is_playing():
		GV.playerLocation += 1
		if GV.playerLocation == 1:
			GV.fishingScene()
		else:
			get_tree().change_scene_to(levels[GV.playerLocation])

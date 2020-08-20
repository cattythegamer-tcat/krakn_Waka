extends Node2D

onready var levels = ["potato", GV.octopusScene, GV.octopusScene, GV.octopusScene, GV.landScene]

func _ready():
	if GV.playerLocation == 0:
		$transitionAnimations.play("firstMove")
	elif GV.playerLocation == 1:
		$transitionAnimations.play("secondMove")
	elif GV.playerLocation == 2:
		$transitionAnimations.play("thirdMove")
	elif GV.playerLocation == 3:
		$transitionAnimations.play("fourthMove")
	else:
		$transitionAnimations.play("fifthMove")

func _process(delta):
	print("L")
	if !$transitionAnimations.is_playing():
		GV.playerLocation += 1
		if GV.playerLocation == 0:
			GV.fishingScene()
		else:
			get_tree().change_scene_to(levels[GV.playerLocation])

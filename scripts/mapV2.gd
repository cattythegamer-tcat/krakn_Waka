extends Node2D

onready var levels = ["potato", GV.octopusScene, GV.octopusScene, GV.tangaroaScene, GV.landScene]

func _ready():
	match int(round(rand_range(0, 11))):
		0:
			$tip.text = "Tangaroa is the Maori Mythological Sea God"
		1:
			$tip.text = "The Kraken was inspired by old sailor tales of a huge Octopus"
		2:
			$tip.text = "Manta rays are an endangered species, don’t kill them"
		3:
			$tip.text = "Shoot the chicken for a surprise :)"
		4:
			$tip.text = "Most music can be accredited to either Abstraction or Humble Bundle"
		5:
			$tip.text = "The boat you are using is called a “Waka”, a native Maori boat"
		6:
			$tip.text = "Click Escape to open the menu"
		7:
			$tip.text = "This game was made as part of a project to achieve NCEA Lvl 2"
		8:
			$tip.text = "Lots of blink’n documentation was needed to complete this game"
		9:
			$tip.text = "Krak’n Waka took 7 Weeks to make"
		10:
			$tip.text = "The name Krak’n Waka was originally suggested by a play tester"
		11:
			$tip.text = "Fuelled by Chickens"
	
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

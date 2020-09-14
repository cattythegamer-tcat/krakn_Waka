extends Node

const STARTING_FOOD = 11

var easter_egg = false

var difficultyMultipiler = 1

var actionFirePressed = false
var uiExitPressed = false

var actionFireJust = false
var uiExitJust = false

var actionFireReleased = false
var uiExitReleased = false

var food = STARTING_FOOD
var scene = "null"
var scene_end = false

var menu = false
var warning_shot = false

var fish_remaining = 0
var fishTileProb = 0.1
var octopusTileProb = 0.3

var global_difficulty = 1 * difficultyMultipiler

var playerLocation = 0

onready var fishIcon = preload("res://assets/2d/icons/fish_norm.png")
onready var waterIcon = preload("res://assets/2d/icons/water_norm.png")
onready var unknownIcon = preload("res://assets/2d/icons/unknown.png")
onready var landIcon = preload("res://assets/2d/icons/land.png")
onready var wakaIcon = preload("res://assets/2d/icons/playerlocation.png")
onready var octopusIcon = preload("res://assets/2d/icons/octopus_norm.png")

onready var mapScene = preload("res://scenes/mapV2.tscn")
onready var octopusScene = preload("res://scenes/OctopusBoss.tscn")
onready var landScene = preload("res://scenes/landEnding.tscn")
onready var tangaroaScene = preload("res://scenes/tangaroaBoss.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("force_exit"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ui_menu"):
		if menu:
			menu = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			menu = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		Input.action_release("ui_menu")
	
	actionFirePressed = Input.is_action_pressed("action_fire")
	uiExitPressed = Input.is_action_pressed("ui_end")
	
	actionFireJust = Input.is_action_just_pressed("action_fire")
	uiExitJust = Input.is_action_just_pressed("ui_end")
	
	actionFireReleased = Input.is_action_just_released("action_fire")
	uiExitReleased = Input.is_action_just_released("ui_end")
	
	if scene_end:
		scene_end = false
		get_tree().change_scene_to(mapScene)

func fishingScene():
	get_tree().change_scene("res://scenes/fishing.tscn")

func reset():
	food = 11
	scene = "null"
	scene_end = false
	
	octopusTileProb = 0.3
	fishTileProb = 0.1
	fish_remaining = 0
	
	global_difficulty = 1
	playerLocation = 0
	menu = false
	
	get_tree().change_scene_to(mapScene)

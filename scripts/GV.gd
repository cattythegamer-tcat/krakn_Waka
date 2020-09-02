extends Node

var actionFirePressed = false
var uiExitPressed = false
var uiUpPressed = false
var uiDownPressed = false
var uiLeftPressed = false
var uiRightPressed = false
var uiMenuPressed = false

var actionFireJust = false
var uiExitJust = false
var uiUpJust = false
var uiDownJust = false
var uiLeftJust = false
var uiRightJust = false
var uiMenuJust = false

var actionFireReleased = false
var uiExitReleased = false
var uiUpReleased = false
var uiDownReleased = false
var uiLeftReleased = false
var uiRightReleased = false
var uiMenuReleased = false

var food = 110
var scene = "null"
var scene_end = false

var fish_remaining = 0
var fishTileProb = 0.1
var octopusTileProb = 0.3

var global_difficulty = 1

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("force_exit"):
		get_tree().quit()
	
	actionFirePressed = Input.is_action_pressed("action_fire")
	uiExitPressed = Input.is_action_pressed("ui_end")
	uiUpPressed = Input.is_action_pressed("ui_end")
	uiDownPressed = Input.is_action_pressed("ui_end")
	uiLeftPressed = Input.is_action_pressed("ui_left")
	uiRightPressed = Input.is_action_pressed("ui_right")
	uiMenuPressed = Input.is_action_pressed("menu")
	
	actionFireJust = Input.is_action_just_pressed("action_fire")
	uiExitJust = Input.is_action_just_pressed("ui_end")
	uiUpJust = Input.is_action_just_pressed("ui_up")
	uiDownJust = Input.is_action_just_pressed("ui_down")
	uiLeftJust = Input.is_action_just_pressed("ui_left")
	uiRightJust = Input.is_action_just_pressed("ui_right")
	uiMenuJust = Input.is_action_just_pressed("menu")
	
	actionFireReleased = Input.is_action_just_released("action_fire")
	uiExitReleased = Input.is_action_just_released("ui_end")
	uiUpReleased = Input.is_action_just_released("ui_up")
	uiDownReleased = Input.is_action_just_released("ui_down")
	uiLeftReleased = Input.is_action_just_released("ui_left")
	uiRightReleased = Input.is_action_just_released("ui_right")
	uiMenuReleased = Input.is_action_just_released("menu")
	
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
	
	get_tree().change_scene_to(mapScene)

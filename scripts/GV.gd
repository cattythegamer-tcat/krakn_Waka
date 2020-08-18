extends Node

var actionFirePressed = false
var uiExitPressed = false
var uiUpPressed = false
var uiDownPressed = false
var uiLeftPressed = false
var uiRightPressed = false

var actionFireJust = false
var uiExitJust = false
var uiUpJust = false
var uiDownJust = false
var uiLeftJust = false
var uiRightJust = false

var actionFireReleased = false
var uiExitReleased = false
var uiUpReleased = false
var uiDownReleased = false
var uiLeftReleased = false
var uiRightReleased = false

var food = 10
var scene = "null"

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
	
	actionFireJust = Input.is_action_just_pressed("action_fire")
	uiExitJust = Input.is_action_just_pressed("ui_end")
	uiUpJust = Input.is_action_just_pressed("ui_up")
	uiDownJust = Input.is_action_just_pressed("ui_down")
	uiLeftJust = Input.is_action_just_pressed("ui_left")
	uiRightJust = Input.is_action_just_pressed("ui_right")
	
	actionFireReleased = Input.is_action_just_released("action_fire")
	uiExitReleased = Input.is_action_just_released("ui_end")
	uiUpReleased = Input.is_action_just_released("ui_up")
	uiDownReleased = Input.is_action_just_released("ui_down")
	uiLeftReleased = Input.is_action_just_released("ui_left")
	uiRightReleased = Input.is_action_just_released("ui_right")

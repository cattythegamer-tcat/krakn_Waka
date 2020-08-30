extends Spatial

var mouse_sens = 0.3
var camera_anglev = 0

var justFired = 0

onready var camera = $head/Camera
onready var head = $head
onready var gunAnims = $head/Camera/gunAnimations

# Called when the node enters the scene tree for the first time.
func _input(event):         
	if event is InputEventMouseMotion:
		head.rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-75 and camera_anglev+changev<75: #Stopped this script so that the player cant look up or down.
			camera_anglev+=changev
			camera.rotate_x(deg2rad(changev))

func _process(delta):
	if GV.actionFireJust and !gunAnims.is_playing():
		$head/Camera/bullet/collision.disabled = false
		gunAnims.play("reload")
		justFired = 10
	elif justFired >= 0:
		if justFired == 1:
			GV.food -= 1
		justFired -= 1
	$crosshair/Label.text = "Resources: " + str(GV.food - 1)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	gunAnims.play("reload")
	$head/Camera/bullet/collision.disabled = true

extends Spatial


var mouse_sens = 0.3
var camera_anglev = 0

onready var camera = $head/Camera
onready var head = $head

# Called when the node enters the scene tree for the first time.
func _input(event):         
	if event is InputEventMouseMotion:
		head.rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50: #Stopped this script so that the player cant look up or down.
			camera_anglev+=changev
			camera.rotate_x(deg2rad(changev))

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

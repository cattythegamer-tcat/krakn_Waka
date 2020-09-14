extends Spatial

var pos_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("continue"):
		$wakaMove.stop()
		if pos_num == 0:
			pos_num += 1
			$move_camera.play("first_pos")
		elif pos_num == 1:
			pos_num += 1
			$move_camera.play("second_pos")
		elif pos_num == 2:
			pos_num += 1
			$move_camera.play("third_pos")
		else:
			get_tree().change_scene_to(GV.mapScene)

func first_pos():
	$waka/Camera.target = $point_1.get_path()
	$waka/Camera.enabled = true

func second_pos():
	$waka/Camera.target = $point_2.get_path()
	$waka/Camera.enabled = true

func third_pos():
	$waka/Camera.target = $point_3.get_path()
	$waka/Camera.enabled = true

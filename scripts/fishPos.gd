extends Spatial

func _ready():
	var anim_speed = rand_range(0.4, 1.2)
	$fishCore/fishSideAnimation.playback_speed = anim_speed
	$fishCore/fishUpAnimation.playback_speed = anim_speed
	pass


func _on_fish_area_entered(area):
	GV.food += 2
	queue_free()

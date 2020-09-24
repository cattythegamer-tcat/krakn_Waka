extends Spatial

func _on_Area_area_entered(area):
	GV.reset()

func _on_StaticBody_area_entered(area):
	$bird4.queue_free()
	GV.easter_egg = true

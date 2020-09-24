extends Area

signal hit

func _on_orb_area_entered(area):
	emit_signal("hit")
	$visual.visible = false
	$hitbox.disabled = true
	$explode.emitting = true

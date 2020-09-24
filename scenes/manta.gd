extends Spatial

signal attacked_manta

func _ready():
	var anim_speed = rand_range(0.4, 1.2)
	$fishCore/fishSideAnimation.playback_speed = anim_speed
	$fishCore/fishUpAnimation.playback_speed = anim_speed


func _on_fish_area_entered(area):
	$deathCooldown.start()
	$fishCore/fish/die.emitting = true
	$fishCore/fish/manta.visible = false
	$fishCore/fish/hitbox.disabled = true
	$fishCore/fish/leftWing.emitting = false
	$fishCore/fish/rightWing.emitting = false
	emit_signal("attacked_manta")


func _on_deathCooldown_timeout():
	queue_free()

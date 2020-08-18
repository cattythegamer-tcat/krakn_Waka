extends Spatial

var bossHealth = 60
var current = 0

func _process(delta):
	$Label.text = "Boss Health: " + str(bossHealth)
	if !$turnAnimations.is_playing():
		if current != 0:
			$turnAnimations.play("bossAttackTurn")
			current = 0
		else:
			$turnAnimations.play("playerAttackTurn")
			current = 1


func _on_target_area_entered(area):
	$target.visible = false
	$target/hitbox.disabled = true
	bossHealth -= 10


func _on_target2_area_entered(area):
	$target2.visible = false
	$target2/hitbox.disabled = true
	bossHealth -= 10


func _on_target3_area_entered(area):
	$target3.visible = false
	$target3/hitbox.disabled = true
	bossHealth -= 10


func _on_target4_area_entered(area):
	$target4.visible = false
	$target4/hitbox.disabled = true
	bossHealth -= 10


func _on_target5_area_entered(area):
	$target5.visible = false
	$target5/hitbox.disabled = true
	bossHealth -= 10


func _on_target6_area_entered(area):
	$target6.visible = false
	$target6/hitbox.disabled = true
	bossHealth -= 10

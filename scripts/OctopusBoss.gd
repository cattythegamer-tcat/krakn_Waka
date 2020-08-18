extends Spatial

var bossHealth = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_target_area_entered(area):
	$target.visible = false
	$target/hitbox.disabled = true


func _on_target2_area_entered(area):
	$target2.visible = false
	$target2/hitbox.disabled = true


func _on_target3_area_entered(area):
	$target3.visible = false
	$target3/hitbox.disabled = true


func _on_target4_area_entered(area):
	$target4.visible = false
	$target4/hitbox.disabled = true


func _on_target5_area_entered(area):
	$target5.visible = false
	$target5/hitbox.disabled = true


func _on_target6_area_entered(area):
	$target6.visible = false
	$target6/hitbox.disabled = true

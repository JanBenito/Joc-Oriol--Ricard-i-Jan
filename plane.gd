extends Area2D
var speed = 200
var Bom = preload("res://bomba.tscn")

func _ready():
	pass
func _process(delta):
	position += Vector2(speed*delta, 0)


func _on_Area2D_area_entered(area):
	speed = -speed
	if speed < 0:
		$AnimatedSprite.play("girat")
	if speed > 0:
		$AnimatedSprite.play(" normal")


func _on_Timerbomb_timeout():
	$Path2D/PathFollow2D.set_unit_offset(randf()*1)
	var bom = Bom.instance()
	bom.position= $Path2D/PathFollow2D.global_position
	get_parent().add_child(bom)

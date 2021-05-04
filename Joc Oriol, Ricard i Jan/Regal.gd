extends KinematicBody2D

var velocitat = Vector2.ZERO
var gravetat = 300




func _ready():
	velocitat = Vector2(-300,-200)
	$Area2D/AnimatedSprite.scale = Vector2(0.08, 0.07)
	$Area2D/AnimatedSprite.play("normal")

	 
	


func _process(delta):
	velocitat.y += gravetat * delta
	rotation_degrees += 360 * delta
	move_and_slide(velocitat, Vector2.UP)
	if is_on_floor():
		$Area2D/AnimatedSprite.scale = Vector2(1,1)
		$Area2D/AnimatedSprite.play('Explosió')
		velocitat = Vector2.ZERO
	
func _on_AnimatedSprite_animation_finished():
	if $Area2D/AnimatedSprite.animation == 'Explosió':
		queue_free()

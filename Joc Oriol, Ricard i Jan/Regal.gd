extends KinematicBody2D

var velocitat = Vector2.ZERO
var gravetat = 300




func _ready():
	velocitat = Vector2(-300,-200)

	 
	


func _process(delta):
	velocitat.y += gravetat * delta
	rotation_degrees += 360 * delta
	move_and_slide(velocitat)
	



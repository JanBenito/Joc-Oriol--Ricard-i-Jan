extends KinematicBody2D

var direccio = Vector2.RIGHT
var velocitat = 300

func _ready():
	pass
	
func _process(delta):
	position += direccio * velocitat * delta

extends Area2D

var direccio = Vector2.RIGHT
export var velocitat = 1000

func _ready():
	Global.ganivets
	
func _process(delta):
	position += direccio * velocitat * delta

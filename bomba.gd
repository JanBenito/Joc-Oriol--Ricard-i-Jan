extends Area2D
var speed = 300

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	position += Vector2(0,speed*delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	speed = 0
	$AnimatedSprite.play("explosion")
	$Timer.start()

func _on_Timer_timeout():
	queue_free()

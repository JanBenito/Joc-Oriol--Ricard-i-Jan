extends Area2D
var speed = 200

func _ready():
	var scal = rand_range(0.3,0.7)
	scale = Vector2(scal,scal)
	if scal >= 0.7:
		speed =300
	if scal <=0.5:
		speed = 100
	if scal<= 0.4:
		speed=600
func _process(delta):
	position += Vector2(0,speed*delta)


func _on_Timer_timeout():
	queue_free()

extends Node2D



func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		dispara()
		
	
func dispara():
	var escena_ganivet = load("res://ganivet.tscn")
	var nou_ganivet = escena_ganivet.instance()
	nou_ganivet.global_position = global_position
	nou_ganivet.direccio = Vector2.LEFT
	
	Global.ganivets.add_child(nou_ganivet)

extends KinematicBody2D

var velocitat :Vector2 = Vector2(100, 100)
var acceleracio :Vector2 = Vector2(3, 5)
export var velocitat_max = 500
var gravetat = 1000.0



	
func _anima():


func _process(delta):		
	if Input.is_action_just_pressed("e"):
		dispara()
		
	if velocitat.x != 0:
		if velocitat.y != 0:
			$Sprite_personatge.animation = "saltar"
		else:
			$Sprite_personatge.animation = "correr"
			
	elif velocitat.y != 0:
		$Sprite_personatge.animation = "saltar"
	else:
		$Sprite_personatge.animation = "quiet"
	if velocitat.x < 0:
		$Sprite_personatge.flip_h = true
	else:
		$Sprite_personatge.flip_h = false
		
		
func dispara():
	var escena_ganivet = load("res://ganivet.tscn")
	var nou_ganivet = escena_ganivet.instance()
	nou_ganivet.global_position = global_position
	nou_ganivet.direccio = Vector2.RIGHT
	
	Global.ganivets.add_child(nou_ganivet)

func _physics_process(delta):
	if Input.get_action_strength("e"):
		dispara()
	if Input.is_action_just_pressed("espai"):
		velocitat.y = -500
	if Input.is_action_pressed("d"):
		velocitat.x = 500
	elif Input.is_action_pressed("a"):
		velocitat.x = -500
	else:
		velocitat.x = 0
	velocitat.y += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)

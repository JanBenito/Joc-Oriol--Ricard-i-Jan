extends KinematicBody2D

var velocitat :Vector2 = Vector2(100, 100)
var acceleracio :Vector2 = Vector2(3, 5)
export var velocitat_max = 500
var gravetat = 3000.0

func _ready():
	position = Vector2(30, 30)


func _process(delta):		
	if Input.get_action_strength("e"):
		dispara()
		
func _anima():
	if velocitat.x != 0:
		$AnimatedSprite.animation.play("correr")
		$AnimatedSprite.flip_h = velocitat.x >  0
		$AnimatedSprite.flip_v = false
	elif velocitat.y != 0:
		$AnimatedSprite.animation.play("salt")
		
func dispara():
	var escena_ganivet = load("res://ganivet.tscn")
	var nou_ganivet = escena_ganivet.instance()
	nou_ganivet.global_position = global_position
	nou_ganivet.direccio = Vector2.LEFT
	
	Global.ganivetes.add_child(nou_ganivet)

func _physics_process(delta):
	if Input.is_action_just_pressed("espai"):
		velocitat.y = -1200
	if Input.is_action_pressed("d"):
		velocitat.x = 1200
	elif Input.is_action_pressed("a"):
		velocitat.x = -1200
	else:
		velocitat.x = 0
	velocitat.y += gravetat * delta
	#velocitat.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	#velocitat = velocitat.normalized() * velocitat_max
	#var resultat_moviment = move_and_slide(velocitat, Vector2.UP)
	velocitat = move_and_slide(velocitat, Vector2.UP)

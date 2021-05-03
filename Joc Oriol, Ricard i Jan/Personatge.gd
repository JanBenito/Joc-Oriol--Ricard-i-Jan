extends KinematicBody2D

var velocitat :Vector2 = Vector2(100, 100)
var acceleracio :Vector2 = Vector2(3, 5)
export var velocitat_max = 500



func _process(delta):
	velocitat = Vector2.ZERO
	velocitat.x = Input.get_action_strength("right key") - Input.get_action_strength("left key")
	velocitat.y = Input.get_action_strength("lower key") - Input.get_action_strength("upper key")
	velocitat = velocitat.normalized() * velocitat_max
	var resultat_moviment = move_and_slide(velocitat, Vector2.UP)
	if is_on_floor():
		print("Ets al terra")
	if is_on_ceiling():
		print("Ets al sostre")
	if is_on_wall():
		print("Has tocat un cos")
		
	if Input.get_action_strength("espai"):
		pass

	

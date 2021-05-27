extends KinematicBody2D

var vida = 100
var velocitat = -400



func _ready():
	$AnimatedSprite.play("Caminar")
	if velocitat > 0:
		$AnimatedSprite.play_backwards("Caminar")
	

func _process(delta):
	position += Vector2(velocitat * delta, 0)
	$TextureProgress.value = vida
	if vida <= 0:
		$AnimatedSprite.play("Mort")
	
func dispara():
	var escena_bala = load("res://Regal.tscn")
	var nova_bala = escena_bala.instance()
	nova_bala.global_position = global_position
	Global.Bales.add_child(nova_bala)


func _on_Area2D_area_entered(area):
	if area.has_method("a"):
		velocitat = - velocitat
	else:
		vida -= 5
	

func _on_Timer_timeout():
	dispara()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Mort":
		queue_free()

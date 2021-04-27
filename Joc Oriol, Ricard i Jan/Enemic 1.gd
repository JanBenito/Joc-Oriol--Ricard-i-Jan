extends KinematicBody2D

var vida = 100




func _ready():
	pass 


func _process(delta):
	pass

func dispara():
	var escena_bala = load("res://Regal.tscn")
	var nova_bala = escena_bala.instance()
	nova_bala.global_position = global_position
	Global.Bales.add_child(nova_bala)


func _on_Area2D_area_entered(area):
	vida -= 5


func _on_Timer_timeout():
	dispara()

extends Node2D
var past = preload("res://cos verd.tscn")
var coc = preload("res://cos blanc.tscn")




func _on_Timer_timeout():
	$Path2D/PathFollow2D.set_unit_offset(randf()*1)
	var meteoro = past.instance()
	meteoro.position= $Path2D/PathFollow2D.global_position
	get_parent().add_child(meteoro)


func _on__blanc_timeout():
	$Path2D/PathFollow2D.set_unit_offset(randf()*1)
	var meteoro = coc.instance()
	meteoro.position= $Path2D/PathFollow2D.global_position
	get_parent().add_child(meteoro)

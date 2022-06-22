extends Node2D 
var enemigos = 1
const SCREEN_WIDTH = 1024
const SCREEN_HEIGHT = 600
var new_enemy = preload("res://Enemigos/Enemigo_Slime/Slime.tscn").instance()


func _ready():
	randomize()
	spawn_enemy()
#	dead_enemy()
	
	
	
	

	
	
	

func spawn_enemy():

	new_enemy.position.x = randi() % SCREEN_WIDTH
	new_enemy.position.y = randi() % SCREEN_HEIGHT
	add_child(new_enemy)
	
#func dead_enemy():
#	enemigos = new_enemy.get_prompt()
#	pass
	
	
	
	







func _on_Slime_tree_exited():
	print("salio1")
	
	pass # Replace with function body.


func _on_Slime_visibility_changed():
	print("salio2")
	pass # Replace with function body.

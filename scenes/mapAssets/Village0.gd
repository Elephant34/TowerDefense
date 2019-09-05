extends Control


func _on_special_pressed(extra_arg_0):
	spawn_new_special(extra_arg_0)


func _on_resource_pressed(extra_arg_0):
	spawn_new_resource(extra_arg_0)
	
func spawn_new_resource(position):
	print("Spawing resource tower at position %s", position)

func spawn_new_special(position):
	print("Spawning special tower at position %s", position)

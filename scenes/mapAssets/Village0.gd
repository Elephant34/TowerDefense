extends Control


func _ready():
	for child in $ZoneMarkers.get_children():
		child.visible = false
	
	match globals.current_zone:
		0:
			$ZoneMarkers/Zone0.visible = true
		1:
			$ZoneMarkers/Zone1.visible = true
		2:
			$ZoneMarkers/Zone2.visible = true
		3:
			$ZoneMarkers/Zone3.visible = true
		4:
			$ZoneMarkers/Zone4.visible = true


func _on_special_pressed(extra_arg_0):
	spawn_new_special(extra_arg_0)

func spawn_new_special(position):
	print("Spawning special tower at position ", position)

func _on_resource_pressed(extra_arg_0):
	spawn_new_resource(extra_arg_0)
	
func spawn_new_resource(position):
	print("Spawing resource tower at position ", position)


func _on_Zone_pressed(extra_arg_0):
	print("loading zone ", extra_arg_0)

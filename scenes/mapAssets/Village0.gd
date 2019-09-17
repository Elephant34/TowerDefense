extends Control


func _ready():
	for child in $ZoneMarkers.get_children():
		child.visible = false
	
	if globals.current_zone == 0:
		$ZoneMarkers/Zone0.visible = true
	if globals.current_zone == 1:
		$ZoneMarkers/Zone1.visible = true
	if globals.current_zone == 2:
		$ZoneMarkers/Zone2.visible = true
	if globals.current_zone == 3:
		$ZoneMarkers/Zone3.visible = true
	if globals.current_zone == 4:
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
	
	match extra_arg_0:
		0:
			get_tree().change_scene("res://scenes/levels/Village0/Level0.tscn")
		1:
			get_tree().change_scene("res://scenes/levels/Village0/Level1.tscn")
		2:
			get_tree().change_scene("res://scenes/levels/Village0/Level2.tscn")
		3:
			get_tree().change_scene("res://scenes/levels/Village0/Level3.tscn")
		4:
			get_tree().change_scene("res://scenes/levels/Village0/Level4.tscn")

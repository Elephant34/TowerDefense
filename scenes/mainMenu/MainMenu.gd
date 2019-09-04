extends MarginContainer


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/mapAssets/WorldMap.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/creditsMenu/CreditsMenu.tscn")


func _on_Quit_pressed():
	get_tree().quit()

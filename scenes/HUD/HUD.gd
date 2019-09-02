extends Control


func _on_UpArrow_pressed():
	$MarginContainer/UpArrow.visible = false
	$MarginContainer/DownArrow.visible = true
	
	$TowerSelection.visible = false


func _on_DownArrow_pressed():
	$MarginContainer/UpArrow.visible = true
	$MarginContainer/DownArrow.visible = false
	
	$TowerSelection.visible = true

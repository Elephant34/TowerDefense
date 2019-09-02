extends Control


func _on_UpArrow_pressed():
	$MarginContainer/UpArrow.visible = false
	$MarginContainer/DownArrow.visible = true
	
	$TowerSelection.visible = false


func _on_DownArrow_pressed():
	$MarginContainer/UpArrow.visible = true
	$MarginContainer/DownArrow.visible = false
	
	$TowerSelection.visible = true


func _on_Cannon_pressed():
	if get_parent().coins >= 100:
		get_parent().coins -= 100
		
		$TowerSelection.visible = false
		$MarginContainer/UpArrow.visible = false
		$MarginContainer/DownArrow.visible = true
		
		get_parent().new_tower("cannon")

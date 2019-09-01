extends Control




func _on_UpArrow_pressed():
	$MarginContainer/UpArrow.visible = false
	$MarginContainer/DownArrow.visible = true


func _on_DownArrow_pressed():
	$MarginContainer/UpArrow.visible = true
	$MarginContainer/DownArrow.visible = false

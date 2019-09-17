extends Node

var level

var consol_resource = load("res://scenes/levels/Consol.tscn")
var consol

# Cheat code
var sequence = [
    KEY_UP,
    KEY_UP,
    KEY_DOWN,
    KEY_DOWN,
    KEY_LEFT,
    KEY_RIGHT,
    KEY_LEFT,
    KEY_RIGHT,
    KEY_B,
    KEY_A
]
var sequence_index = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == sequence[sequence_index]:
			sequence_index += 1
			if sequence_index == sequence.size():
				level = get_tree().get_root().get_children()[2]
				
				consol = consol_resource.instance()
				
				level.add_child(consol)
				
				sequence_index = 0
		else:
			sequence_index = 0

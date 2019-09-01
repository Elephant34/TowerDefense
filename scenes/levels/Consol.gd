extends Control

var command
var command_base
var command_args = []


func _ready():
	$LineEdit.grab_focus()

func _on_TextEdit_text_entered(new_text):
	command = $LineEdit.text
	$LineEdit.text = ""
	
	command_base = command.split(" ")[0]
	
	for i in range(command.split(" ").size()):
		if i != 0:
			command_args.append(command.split(" ")[i])
	
	if len(command_args) == 0:
		queue_free()
		return
	
	if not "cont" == command_args[-1]:
		queue_free()
	else:
		command_args.remove(-1)
	
	match command_base:
		"give":
			give()
		"kill":
			kill()
	
	command = null
	command_base = null
	command_args = []


func _on_LineEdit_text_changed(new_text):
	if $LineEdit.text.length() == 1 and new_text == "a":
		$LineEdit.text = ""

func give():
	match command_args[0]:
		"coins":
			give_coins()
		"mana":
			give_mana()
		"civilians":
			give_civilians()

func give_coins():
	get_parent().coins += int(command_args[1])

func give_mana():
	get_parent().mana += int(command_args[1])

func give_civilians():
	get_parent().civilians += int(command_args[1])

func kill():
	var enemies = get_parent().get_node("Enemies").get_children()
	
	match command_args[0]:
		"all":
			for child in enemies:
				child.queue_free()
				
		"leader":
			var dead = enemies[0]
			for child in enemies:
				if child.offset > dead.offset:
					dead = child
			dead.queue_free()
			
		"tailer":
			var dead = enemies[0]
			for child in enemies:
				if child.offset < dead.offset:
					dead = child
			dead.queue_free()
			
		"all_but_tailer":
			var survive = enemies[0]
			
			while len(enemies) > 1:
				for child in enemies:
					if child.offset < survive.offset:
						survive = child
					else:
						child.queue_free()
						enemies.erase(child)
						
		"all_but_leader":
			var survive = enemies[0]
			
			while len(enemies) > 1:
				for child in enemies:
					if child.offset > survive.offset:
						survive = child
					else:
						child.queue_free()
						enemies.erase(child)
		
		"random":
			randomize()
			enemies[rand_range(0, len(enemies))].queue_free()

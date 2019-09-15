extends Node

# Percistet gobal varables of user progress
var experience = 0
var current_zone = 0
var village_respect = {
	0: 0,
}
var towers_unlocked = [
	"turret",
	"sniper",
	"machine",
	"cannon",
]

var save_raw


func _ready():
	load_save()
	
	save_game()

func load_save():
	# Opens the game data file to load the values

	var game_save = File.new()
	
	# If the data is blank
	if not game_save.file_exists("user://TowerDefence.save"):
		return {}
	
	game_save.open("user://TowerDefence.save", File.READ)

	var data = parse_json(game_save.get_as_text())

	game_save.close()
	
	# Sets the varabls from the dictionary
	experience = data["experience"]
	current_zone = data["current_zone"]
	village_respect = data["village_respect"]
	towers_unlocked = data["towers_unlocked"]

	return

func save_game():
	# Stores the game data to a persistant file
	
	# Gets the varable values into  dictionary
	var compiled_data = {
		"experience": experience,
		"current_zone": current_zone,
		"village_respect": village_respect,
		"towers_unlocked": towers_unlocked
	}

	var game_save = File.new()

	game_save.open("user://TowerDefence.save", File.WRITE)
	
	game_save.store_line(to_json(compiled_data))

	game_save.close()

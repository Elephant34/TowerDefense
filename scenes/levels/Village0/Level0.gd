extends Container

# Tower resouces
var cannon_resource = preload("res://scenes/towers/cannon/Cannon.tscn")

# Enemy resources
var standard_resource = preload("res://scenes/ememies/standered/Standered.tscn")

var waves = 5
var wave_data = {
	"easy": [
			["s"],
			["s", "s"],
			["s", "m", "s"],
			["s", "s", "s", "s"],
			["s", "m", "m", "m"]
		],
}

var current_wave = 0

var mode = globals.difficulty

export var coins = 100
export var mana = 0
export var civilians = 30

func _ready():
	wave_data = wave_data[mode]

func _process(delta):
	$HUD/Resources/VBoxContainer/Civilians.text = "Civilians: " + str(civilians)
	$HUD/Resources/VBoxContainer/Coins.text = "Coins: " + str(coins)
	$HUD/Resources/VBoxContainer/Mana.text = "Mana: " + str(mana)
	
	$HUD/Level/VBoxContainer/Wave.text = "Wave: " + str(current_wave) + "/" + str(waves)

func new_tower(type):
	match type:
		"cannon":
			var cannon = cannon_resource.instance()
			$Towers.add_child(cannon)

func spawn_wave():
	$Enemies.add_child(standard_resource.instance())
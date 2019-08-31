extends Container

var waves = 3
var wave_data = {
	"easy": [["s"], ["s", "m"], ["s", "s", "s"]],
	"normal": [["s"], ["s", "m"], ["s", "m", "m"]],
	"hard": [["s", "s"], ["s", "s", "m"], ["m", "m", "f"]]
}

var current_wave = 0

var mode = "easy"

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
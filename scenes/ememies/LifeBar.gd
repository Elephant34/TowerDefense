extends TextureProgress

var max_health
var current_health

func _ready():
	max_health = get_parent().max_health

func _process(delta):
	current_health = get_parent().health
	
	self.value = (current_health/max_health) * 100

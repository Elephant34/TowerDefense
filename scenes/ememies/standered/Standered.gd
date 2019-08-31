extends PathFollow2D

export var speed = 1.4

export var gold_worth = 10
export var mana_worth = 0

export var max_health = 3.0
var health

func _ready():
	health = max_health

func _physics_process(delta):
	# If it is dead- disappear
	if health <= 0:
		##=========
		# Add death animation or something?
		##=========
		
		# Adds the gold and mana resources to the level
		get_parent().get_parent().coins += gold_worth
		get_parent().get_parent().mana += mana_worth
		
		queue_free()
	else:
		# Increases the path offset which moves the sprite along
		self.offset += speed
		
		# When the sprite reaches the end of the path disappear
		if self.unit_offset >= 1:
			queue_free()

func _on_Area2D_area_entered(area):
	# If it has been hit by a bullet loose a life
	if area.is_in_group("bullet"):
		health -= area.damage

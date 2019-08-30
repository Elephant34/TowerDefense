extends PathFollow2D

export var speed = 2.0
export var health = 3

func _physics_process(delta):
	# If it is dead- disappear
	if health <= 0:
		##=========
		# Add death animation or something?
		##=========
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
		health -= 1

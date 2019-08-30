extends PathFollow2D

export var speed = 2
export var health = 3

func _physics_process(delta):
	self.offset += speed
	
	if self.unit_offset >= 1:
		queue_free()
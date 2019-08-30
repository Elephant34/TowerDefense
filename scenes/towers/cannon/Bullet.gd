extends Area2D

export var speed = 1
export var damage = 1

var my_target
var target_position

var target_alive

var direction

func _ready():
	# Selects the target from the parent
	my_target = get_parent().target
	# Forms a weak link to the target so it can be checked if still alive
	target_alive = weakref(my_target)

func _process(delta):
	
	# Checks the target is alive
	if target_alive.get_ref():
		
		target_position = my_target.get_parent().position
		direction = target_position - self.position
		
		# Roates to face the target
		# I don't know how this works but it does... (thx stackoverflow)
		self.rotation_degrees = rad2deg(atan2(direction.y, - direction.x))+90
	
	# Moves the bullet in a straight line towards the enemy
	self.position = position + Vector2(speed, 0)

func _on_Area2D_area_entered(area):
	# If it hits disapear
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	# If it goes off screen
	# AKA it misses- disappear
	queue_free()

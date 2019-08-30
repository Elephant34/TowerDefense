extends Area2D

export var speed = 1
export var damage = 1

var my_target
var target_position

var target_alive

var direction

func _ready():
	my_target = get_parent().target
	target_alive = weakref(my_target)

func _process(delta):
	if target_alive.get_ref():
		target_position = my_target.get_parent().position
		direction = target_position - self.position
			
		self.rotation_degrees = rad2deg(atan2(direction.y, - direction.x))+90
		
	self.position = position + Vector2(speed, 0)

func _on_Area2D_area_entered(area):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

extends Area2D

# Stores the enemies which are in range
var in_range = []

var target

export var bullet_cooldown = 0.7

var bullet_resource = load("res://scenes/towers/cannon/Bullet.tscn")

func _ready():
	$BulletCooldown.wait_time = bullet_cooldown

func _on_range_area_entered(area):
	# Tests if they are an enemy
	if area.get_parent().is_in_group("enemy"):
		# If no target has been selected asign this one
		if not target:
			target = area
		
		# Add the enemy to the list
		in_range.append(area)


func _on_range_area_exited(area):
	# The enemy is now out of range
	in_range.erase(area)
	
func _process(delta):
	# If the target isn't in range forget it
	if not target in in_range:
		target = null
	
	# If their are enemies in range
	if in_range:
		
		# If no target is assigned put it as the first enemy in the list
		if not target:
			target = in_range[0]
		
		# Checks every enemy if to see which is furvis along
		for enemy in in_range:
			if enemy.get_parent().offset > target.get_parent().offset:
				target = enemy
	else:
		target = null
	
	if target:
		# Looks at the selected target
		look_at(target.get_parent().position)

func _on_BulletCooldown_timeout():
	# If the tower has a target spawn a bullet
	if target:
		var Bullet = bullet_resource.instance()
		add_child(Bullet)

extends Area2D

var in_range = []
var target

export var bullet_cooldown = 0.7

var bullet_resource = load("res://scenes/towers/cannon/Bullet.tscn")

func _ready():
	$BulletCooldown.wait_time = bullet_cooldown

func _on_range_area_entered(area):
	if not target:
		target = area
	in_range.append(area)


func _on_range_area_exited(area):
	in_range.erase(area)
	
func _process(delta):
	if not target in in_range:
		target = null
	if in_range:
		if not target:
			target = in_range[0]
		for enemy in in_range:
			if enemy.get_parent().offset > target.get_parent().offset:
				target = enemy
	else:
		target = null
	
	if target:
		look_at(target.get_parent().position)

func _on_BulletCooldown_timeout():
	if target:
		var Bullet = bullet_resource.instance()
		add_child(Bullet)

@icon ("res://addons/at-icons/node2d/human.svg")
class_name Player extends Node2D

@export var bullet_scene: PackedScene
@export var speed: int = 100

var bullet_offset: int = 30
func _process(delta: float) -> void:
	if (Input.is_action_pressed("move_left")):
		position.x -= speed * delta
	elif (Input.is_action_pressed("move_right")):
		position.x += speed * delta
	if (Input.is_action_just_pressed("shoot")):
		var bullet_instance = bullet_scene.instantiate()
		get_tree().get_nodes_in_group("game")[0].add_child(bullet_instance)
		bullet_instance.position = position
		bullet_instance.position.y -= bullet_offset
		

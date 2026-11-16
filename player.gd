@icon ("res://addons/at-icons/node2d/human.svg")
class_name Player extends Node2D

@export var bullet_scene: PackedScene
@export var speed: int = 100

var bullet_offset: int = 30
var game_instance: Game

func _ready() -> void:
	game_instance = get_parent() as Game

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		if position.x >= game_instance.world_left_limit:
			position.x -= speed * delta
	elif Input.is_action_pressed("move_right"):
		if position.x <= game_instance.world_right_limit:
			position.x += speed * delta
	if (Input.is_action_just_pressed("shoot")):
		var bullet_instance = bullet_scene.instantiate()
		get_tree().get_nodes_in_group("game")[0].add_child(bullet_instance)
		bullet_instance.position = position
		bullet_instance.position.y -= bullet_offset
		

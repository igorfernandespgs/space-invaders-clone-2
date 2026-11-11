@icon ("res://addons/at-icons/node2d/human.svg")
class_name Player extends Node2D

@export var speed: int = 100

func _process(delta: float) -> void:
	if (Input.is_action_pressed("move_left")):
		position.x -= speed * delta
	elif (Input.is_action_pressed("move_right")):
		position.x += speed * delta
	if (Input.is_action_just_pressed("shoot")):  
		print("shoot!")

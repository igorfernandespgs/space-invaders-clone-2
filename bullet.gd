class_name Bullet extends Node2D

@export var speed = 250

func _process(delta: float) -> void:
	position.y += speed * -1 * delta

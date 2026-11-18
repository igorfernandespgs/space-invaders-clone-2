@icon ("res://addons/at-icons/node2d/bullet.svg")
class_name Bullet extends Node2D

# TODO: Refazer com Area2D

@export var speed = 250

var bullet_size: Vector2i
var sprite: Sprite2D 

func _ready() -> void:
	sprite = $Sprite2D
	bullet_size = Vector2i()
	var sprite_rect: Rect2 = sprite.get_rect()
	bullet_size.x = int(sprite_rect.size.x * sprite.scale.x)
	bullet_size.y = int(sprite_rect.size.y * sprite.scale.y)

func _process(delta: float) -> void:
	position.y += speed * -1 * delta
	# Precisamos levar em conta metade do tamanho da bala a mais
	# no cálculo, pois o seu ponto de origem é o centro
	var half_bullet_size = float(bullet_size.y)/2
	var hit_top_wall = position.y - bullet_size.y <= -half_bullet_size
	if (hit_top_wall):
		print("hit wall")
		queue_free()
	

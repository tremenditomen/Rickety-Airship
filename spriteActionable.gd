extends Area2D

@onready var fire_sprite = $"../FireSprite"
@onready var ship = $"../.."

func action() -> void:
	fire_sprite.show()
	fire_sprite.play("default")
	ship.increase()
	ship._on_timer_timeout()

func _on_fire_timer_timeout():
	fire_sprite.hide()

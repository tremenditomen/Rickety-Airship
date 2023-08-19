extends Area2D

@onready var fire_sprite = $"../FireSprite"

func action() -> void:
	fire_sprite.show()
	fire_sprite.play("default")



func _on_fire_timer_timeout():
	fire_sprite.hide()

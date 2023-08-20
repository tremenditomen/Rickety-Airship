extends Area2D


@onready var ropes_controller = $".."

func action() -> void:
 ropes_controller.fasten_rope(["rope2"])

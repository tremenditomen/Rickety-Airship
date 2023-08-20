extends Area2D


@onready var ropes_controller = $".."

func action() -> void:
 ropes_controller.fasten_rope(["rope6", "rope7", "rope8", "rope9", "rope10"])

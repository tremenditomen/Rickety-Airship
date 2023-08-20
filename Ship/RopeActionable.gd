extends Area2D

@onready var ropes_controller = $".."

func action() -> void:
 ropes_controller.fasten_rope(["rope1", "rope2", "rope3", "rope4", "rope5"])
	


extends Area2D
@onready var fire = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	fire.play("fire")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

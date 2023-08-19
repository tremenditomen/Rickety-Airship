extends Node2D


var airship_speed = 25

@onready var sprite = get_node("./ShipArea/ShipSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("This is a hello world")
	print("Ship: ", sprite)
	sprite.play("external", airship_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

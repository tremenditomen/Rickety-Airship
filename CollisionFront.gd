extends CollisionShape2D


@onready var player = $"../../../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	print('player', player)
	var actionables = player.get_overlapping_areas()
	if actionables.size() > 0:
		actionables[0].action()
		return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

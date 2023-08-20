extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	fadeToBlack()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func fadeToBlack():
	$AnimationPlayer.play("fade_to_black")

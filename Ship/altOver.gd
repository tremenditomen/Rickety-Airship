extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
	
@onready var animation_player = $"../AnimationPlayer"
@onready var crash_label = $"../CrashLabel"


func transition ():
	crash_label.visible = true
	animation_player.play("fade_to_black")

extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
	
@onready var animation_player = $"../AnimationPlayer"
@onready var dialogue_label = $"../DialogueLabel"

func transition ():
	dialogue_label.visible = true
	animation_player.play("fade_to_black")

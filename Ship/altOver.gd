extends CanvasLayer

	
@onready var dialogue_label = $"../DialogueLabel"
@onready var animation_player = $"../AnimationPlayer"


func transition ():
	dialogue_label.visible = true
	animation_player.play("fade_to_black")

extends CanvasLayer
@onready var animation_player = $"../AnimationPlayer"
@onready var dialogue_label = $"../DialogueLabel"

func transition ():
	dialogue_label.visible = true
	animation_player.play("complete")

extends CanvasLayer


func transition ():
	$DialogueLabel.visible = true
	$AnimationPlayer.play("Complete")

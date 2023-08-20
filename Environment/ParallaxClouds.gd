extends ParallaxBackground

var scroll_speed = 40

var dialogue_resource = preload("res://Dialogue/intro.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(2).timeout
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, 'intro_start')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= scroll_speed * delta

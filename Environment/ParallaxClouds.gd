extends ParallaxBackground

var scroll_speed = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello from the background controller")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("scroll_offset is: ", scroll_offset)
	print("Delta is: ", delta) 
	print("Scroll speed will be: ", scroll_speed * delta)
	scroll_offset.x -= scroll_speed * delta

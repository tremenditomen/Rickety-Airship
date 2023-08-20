extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fullDistance():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("07d104")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
func midDistance():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c6c61b")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
	
func lowDistance():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c90000")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
	

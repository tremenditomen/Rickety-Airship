extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func fullfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("07d104")
	sb.set_border_width_all(1)
	sb.border_color = Color("000000")
func midfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c6c61b")
	sb.set_border_width_all(1)
	sb.border_color = Color("000000")
	
func lowfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c90000")
	sb.set_border_width_all(1)
	sb.border_color = Color("000000")

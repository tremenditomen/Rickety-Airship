extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fullaltitude():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("0262e0")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
func midaltitude():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c6c61b")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
	
func lowaltitude():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c90000")
	sb.set_border_width_all(5)
	sb.border_color = Color("000000")
	

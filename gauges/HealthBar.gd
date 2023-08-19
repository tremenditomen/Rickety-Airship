extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fullhealth():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("07d104")
func midhealth():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c6c61b")
	
func lowhealth():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c90000")
	

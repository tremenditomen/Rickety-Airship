extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fullfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("07d104")
func midfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c6c61b")
	
func lowfuel():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("c90000")
	

extends Node2D
var ropeKlass = load("res://Ship/RopeClass.gd")
var rng = RandomNumberGenerator.new()

var ropeDict = {
	rope1 = ropeKlass.new(Vector2(175, 157), Vector2(208, 211)),
	rope2 = ropeKlass.new(Vector2(191.5,162), Vector2(217, 211)),	
	rope3 = ropeKlass.new(Vector2(207.5, 165), Vector2(225, 211)),
	rope4 = ropeKlass.new(Vector2(223.5, 168), Vector2(231.5, 211)),
	rope5 = ropeKlass.new(Vector2(241,171), Vector2(236, 214)),
	rope6 = ropeKlass.new(Vector2(433, 168), Vector2(448, 211)),
	rope7 = ropeKlass.new(Vector2(448.5, 166), Vector2(456, 211)),
	rope8 = ropeKlass.new(Vector2(466.5, 162), Vector2(464, 211)),
	rope9 = ropeKlass.new(Vector2(484, 156), Vector2(470, 211)),
	rope10 = ropeKlass.new(Vector2(505, 150), Vector2(478.5, 211)),
}

func fasten_rope(ropeArray):
	var ropeId
	for i in ropeArray.size():
		ropeId = ropeArray[i]
		ropeDict[ropeId].set_stress(0)
	
func stress_rope(ropeId):
	ropeDict[ropeId].set_stress( ropeDict[ropeId].stress + 1 )

func stressed_ropes():
	var left_rope_ids = ['rope1','rope2','rope3','rope4','rope5',]
	var right_rope_ids = ['rope6','rope7','rope8','rope9','rope10',]
	var broken_left = left_rope_ids.filter(func(ropeId): 
		return ropeDict[ropeId].stress > 2)
	var broken_right = right_rope_ids.filter(func(ropeId): 
		return ropeDict[ropeId].stress > 2)
	return [broken_left, broken_right]
	
func _ready():
	
	for rope in ropeDict:
		add_child(ropeDict[rope].line)
	ropeDict.rope6.set_stress(1)
	await get_tree().create_timer(1).timeout
	ropeDict.rope6.set_stress(2)


func _on_rope_stress_timer_timeout():
	rng.randomize()
	var rngRope = "rope%s"
	var randomNum = rngRope  %rng.randi_range(1,10)
	stress_rope(randomNum)

func _process(delta):
	ropeDict.rope1.rope_redraw()
	ropeDict.rope2.rope_redraw()
	ropeDict.rope3.rope_redraw()
	ropeDict.rope4.rope_redraw()
	ropeDict.rope5.rope_redraw()
	ropeDict.rope6.rope_redraw()
	ropeDict.rope7.rope_redraw()
	ropeDict.rope8.rope_redraw()
	ropeDict.rope9.rope_redraw()
	ropeDict.rope10.rope_redraw()
	print(stressed_ropes())

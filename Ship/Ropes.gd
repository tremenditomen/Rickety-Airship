extends Node2D

var ropeDict = {
	rope1 = {
		'balloon_hook': Vector2(-162, -4),
		'ship_hook': Vector2(-129, 51),
		'line': null
	},
	rope2 = {
		'balloon_hook': Vector2(-144, 1),
		'ship_hook': Vector2(-120, 51),
		'line': null
	},
	rope3 = {
		'balloon_hook': Vector2(-129, 4),
		'ship_hook': Vector2(-111, 51),
		'line': null
	},
	rope4 = {
		'balloon_hook': Vector2(-113, 7),
		'ship_hook': Vector2(-106, 51),
		'line': null
	},
	rope5 = {
		'balloon_hook': Vector2(-96, 10),
		'ship_hook': Vector2(-101, 55),
		'line': null
	},
	rope6 = {
		'balloon_hook': Vector2(96, 7),
		'ship_hook': Vector2(111, 51),
		'line': null
	},
	rope7 = {
		'balloon_hook': Vector2(112, 5),
		'ship_hook': Vector2(119, 51),
		'line': null
	},
	rope8 = {
		'balloon_hook': Vector2(130.5, 1),
		'ship_hook': Vector2(127, 51),
		'line': null
	},
	rope9 = {
		'balloon_hook': Vector2(147.5, -4),
		'ship_hook': Vector2(133.5, 51),
		'line': null
	},
	rope10 = {
		'balloon_hook': Vector2(168, -10),
		'ship_hook': Vector2(141, 51),
		'line': null
	},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	for rope in ropeDict:
		ropeDict[rope].line = create_rope(ropeDict[rope])
	
	print("Ropes: ", ropeDict)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	for rope in ropeDict:
		ropeDict[rope].line = _draw_simple_rope(ropeDict[rope])
	pass
	
func _draw_simple_rope(rope):
	draw_line(rope.balloon_hook, rope.ship_hook, Color(0.4549, 0.247, 0.2235), 2.0)

func create_rope(rope):
	var stress = _determine_stress_point(rope.balloon_hook, rope.ship_hook, 0)
	draw_line(ropeDict.rope6.balloon_hook, ropeDict.rope6.ship_hook, Color(0.4549, 0.247, 0.2235), 2.0)

func _determine_stress_point(p0: Vector2, p1: Vector2, stress_level: float):
	var stress_x = p0.x + _halve_difference(p0.x, p1.x)
	var stress_y = p0.y + _halve_difference(p0.y, p1.y)
	return Vector2(stress_x, stress_y)

func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r

func _halve_difference(p0: float, p1: float):
	return abs((p0 - p1) / 2)

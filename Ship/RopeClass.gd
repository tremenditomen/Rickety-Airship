extends Object

class_name Rope

var balloon_hook: Vector2
var ship_hook: Vector2
var line: Line2D
var stress: int

# Class Constructor
func _init(balloon_hook_init:Vector2, ship_hook_init:Vector2):
	line = Line2D.new()
	balloon_hook = balloon_hook_init
	ship_hook = ship_hook_init
	line.default_color = Color(0.4549, 0.247, 0.2235)
	line.width = 2
	stress = 0
	_draw_simple_rope()

func set_stress(input_stress = false):
	stress = input_stress
	_draw_rope()

func _draw_rope():
	if stress == 0:
		_draw_simple_rope()
	elif stress < 2:
		_draw_curved_rope()
	else:
		_draw_loose_rope()

func _draw_simple_rope():
	line.clear_points()
	line.add_point(balloon_hook)
	line.add_point(ship_hook)
	
func _draw_curved_rope():
	var stress_point = _determine_stress_point()
	var curve_points = range(10).map(func(number): 
		return _quadratic_bezier(balloon_hook, stress_point, ship_hook, number * .1))
	curve_points.push_back(ship_hook)
	line.clear_points()
	curve_points.all(func(point): 
		line.add_point(point) 
		return true)

func _draw_loose_rope():
	var loose_rope_end = _loose_rope_end()
	var rope_point_1 = _quarter_point(balloon_hook, loose_rope_end)
	var rope_point_2 = _quarter_point(loose_rope_end, balloon_hook)
	var curve_points = range(10).map(func(number): 
		return _cubic_bezier(balloon_hook, rope_point_1, rope_point_2, loose_rope_end, number * .1))
	curve_points.push_back(loose_rope_end)
	line.clear_points()
	curve_points.all(func(point): 
		line.add_point(point) 
		return true)

func _determine_stress_point():
	var stress_x = balloon_hook.x - _halve_difference(balloon_hook.x, ship_hook.x) - (stress * 10)
	var stress_y = balloon_hook.y + _halve_difference(ship_hook.y, balloon_hook.y) + (stress * 10)
	return Vector2(stress_x, stress_y)

func _halve_difference(p0: float, p1: float):
	return (p0 - p1) / 2

func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r

func _cubic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, t: float):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var q2 = p2.lerp(p3, t)

	var r0 = q0.lerp(q1, t)
	var r1 = q1.lerp(q2, t)

	var s = r0.lerp(r1, t)
	return s

func _loose_rope_end():
	var loose_rope_end_x = ship_hook.x - abs(_halve_difference(balloon_hook.x, ship_hook.x))
	var loose_rope_end_y = ship_hook.y - 5
	return Vector2(loose_rope_end_x, loose_rope_end_y)

func _quarter_point(start: Vector2, end: Vector2):
	var random = randf_range(-10, 10)
	var quarter_x = start.x - ((start.x - end.x) / 4) + random
	var quarter_y = start.y + ((end.y - start.y) / 4) + random
	return Vector2(quarter_x, quarter_y)

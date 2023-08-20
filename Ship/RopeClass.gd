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
	#_draw_simple_rope()
	_draw_curved_rope()

func _draw_rope():
	if stress > 0:
		_draw_curved_rope()
	else:
		_draw_simple_rope()

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

func _determine_stress_point():
	var stress_x = balloon_hook.x - _halve_difference(balloon_hook.x, ship_hook.x) - stress
	var stress_y = balloon_hook.y + _halve_difference(ship_hook.y, balloon_hook.y) + stress
	return Vector2(stress_x, stress_y)

func _halve_difference(p0: float, p1: float):
	return (p0 - p1) / 2

func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r

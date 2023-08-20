extends Object

class_name Rope

var balloon_hook: Vector2
var ship_hook: Vector2
var line = Line2D.new()
var stress = 0

var stress_modifier = 0

var loose_rope_end: Vector2
var loose_rope_x_modifier = 0
var loose_rope_y_modifier = 0

var broke_rope_point_1: Vector2
var broke_rope_point_2: Vector2

# Class Constructor
func _init(balloon_hook_init:Vector2, ship_hook_init:Vector2):
	balloon_hook = balloon_hook_init
	ship_hook = ship_hook_init
	loose_rope_end = ship_hook_init
	line.default_color = Color(0.4549, 0.247, 0.2235)
	line.width = 2
	draw_rope()
	#_draw_simple_rope()

func set_stress(input_stress = false):
	stress = input_stress
	if (input_stress == 0):
		loose_rope_end = ship_hook
		broke_rope_point_1 == null
		broke_rope_point_2 == null
	draw_rope()

func draw_rope():
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
	_set_loose_rope_end()
	_check_flex_points()
	var curve_points = range(10).map(func(number): 
		return _cubic_bezier(balloon_hook, broke_rope_point_1, broke_rope_point_2, loose_rope_end, number * .1))
	curve_points.push_back(loose_rope_end)
	line.clear_points()
	curve_points.all(func(point): 
		line.add_point(point) 
		return true)

func _determine_stress_point():
	var stress_x = balloon_hook.x - _halve_difference(balloon_hook.x, ship_hook.x) - (stress - _get_stress_modifier())
	var stress_y = balloon_hook.y + _halve_difference(ship_hook.y, balloon_hook.y) + (stress - _get_stress_modifier())
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

func _set_loose_rope_end():
	var loose_rope_end_x = loose_rope_end.x + _get_loose_rope_x_modifier()
	var loose_rope_end_y = loose_rope_end.y + _get_loose_rope_y_modifier()
	loose_rope_end = Vector2(loose_rope_end_x, loose_rope_end_y)

func _quarter_point(start: Vector2, end: Vector2, random = true):
	var randomNum = randf_range(-10, 10)
	var quarter_x = start.x - ((start.x - end.x) / 4) + randomNum
	var quarter_y = start.y + ((end.y - start.y) / 4) + randomNum
	return Vector2(quarter_x, quarter_y)

func rope_redraw():
	if stress > 0:
		draw_rope()

func _get_stress_modifier():
	var random_integer = 0.2
	if (stress_modifier > 0):
		random_integer *= -1
	elif (stress_modifier < -10):
		pass
	else:
		random_integer *= -1^(randi_range(0,1))
	stress_modifier += random_integer
	return stress_modifier
	
func _get_loose_rope_x_modifier():
	var random_integer = 0.001
	if (loose_rope_end.x > balloon_hook.x):
		random_integer *= -1
	elif ((balloon_hook.x - loose_rope_end.x) > 20):
		pass
	else:
		random_integer *= -1^(randi_range(0,1))
	loose_rope_x_modifier += random_integer
	return loose_rope_x_modifier

func _get_loose_rope_y_modifier():
	var distance_from_balloon = loose_rope_end.y - balloon_hook.y
	var distance_from_ship = loose_rope_end.y - ship_hook.y
	var random_integer = 0.001
	if (loose_rope_end.y < 195):
		random_integer *= 1
	elif (distance_from_ship < 10):
		random_integer *= -1
	elif (distance_from_balloon < 30):
		random_integer *= 1
	else:
		random_integer *= -1^(randi_range(0,1))
	loose_rope_y_modifier += random_integer
	return loose_rope_y_modifier

func _check_flex_points():
	broke_rope_point_1 = _quarter_point(balloon_hook, loose_rope_end, loose_rope_x_modifier)
	broke_rope_point_2 = _quarter_point(loose_rope_end, balloon_hook, loose_rope_y_modifier)

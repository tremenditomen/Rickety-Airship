extends Node2D

var rope1dict = {
	'balloon_hook': Vector2(96, 6),
	'ship_hook': Vector2(111, 51)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var rope1 = draw_rope(rope1dict)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func draw_rope(rope):
	var stress = _determine_stress_point(rope.balloon_hook, rope.ship_hook, 0)
	return Curve2D.new()

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

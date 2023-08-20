extends Node2D
var ropeKlass = load("res://Ship/RopeClass.gd")

var ropeDict = {
	rope1 = ropeKlass.new(Vector2(-162, -4), Vector2(-129, 51)),
	rope2 = ropeKlass.new(Vector2(-144, 1), Vector2(-120, 51)),	
	rope3 = ropeKlass.new(Vector2(-129, 4), Vector2(-111, 51)),
	rope4 = ropeKlass.new(Vector2(-113, 7), Vector2(-106, 51)),
	rope5 = ropeKlass.new(Vector2(-96, 10), Vector2(-101, 55)),
	rope6 = ropeKlass.new(Vector2(96, 7), Vector2(111, 51)),
	rope7 = ropeKlass.new(Vector2(112, 5), Vector2(119, 51)),
	rope8 = ropeKlass.new(Vector2(130.5, 1), Vector2(127, 51)),
	rope9 = ropeKlass.new(Vector2(147.5, -4), Vector2(133.5, 51)),
	rope10 = ropeKlass.new(Vector2(168, -10), Vector2(141, 51)),
}

func fasten_rope(ropeId):
	ropeDict[ropeId].stress = 0

func _ready():
	for rope in ropeDict:
		add_child(ropeDict[rope].line)

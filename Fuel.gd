extends Node2D
const MAX_DISTANCE = 10
var distance = 0



@onready var node = get_node("DistanceBar")

func _ready() -> void:
#	set_Distance_label ()
	$DistanceBar.max_value = MAX_DISTANCE
	set_Distance_bar ()

func set_Distance_bar () -> void:
	$DistanceBar.value = distance
	
#func set_Distance_label() -> void:
#	$DistanceBar.text = "Distance: %s" % distance

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("ui_accept"):
#		damage()
#		

#func damage():
	#$Altitude
	#distance +=1
	#if distance<0 || distance == 10:
	#	node.fullfuel()
	#	distance = MAX_DISTANCE
	#elif distance<6 && distance > 3:
	#	node.midfuel()   
#	elif distance<3:
#		node.lowfuel()

	#set_Distance_label()
	#set_Distance_bar()


func _on_timer_timeout():
	distance +=1
	if distance == 7:
		node.fulldistance()

	elif distance<6 && distance > 3:
		node.middistance()   
	elif distance<3:
		node.lowdistance()
	elif distance > MAX_DISTANCE:
		

		distance = 0
#	set_Distance_label()
	set_Distance_bar()


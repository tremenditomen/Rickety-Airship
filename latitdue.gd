extends Node2D
const MAX_ALTITUDE = 10
var altitude = MAX_ALTITUDE


@onready var node = get_node("Altitude")

func _ready() -> void:
	#set_altitude_label ()
	$Altitude.max_value = MAX_ALTITUDE
	set_altitude_bar ()

func set_altitude_bar () -> void:
	$Altitude.value = altitude
	
#func set_altitude_label() -> void:
	#$AltitudeLabel.text = "Altitude: %s" % altitude

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_accept"):
	#	damage()
		

#func damage():
	#$Altitude


func _on_timer_timeout():
	altitude -=.1
	if altitude<0 || altitude == 10:
		node.fullaltitude()
		altitude = MAX_ALTITUDE
	elif altitude<6 && altitude > 3:
		node.midaltitude()
	elif altitude<3:
		node.lowaltitude()

	#set_altitude_label()
	set_altitude_bar()


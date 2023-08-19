extends Node2D
const MAX_FUEL = 10
var fuel = 0



@onready var node = get_node("FuelBar")

func _ready() -> void:
	set_fuel_label ()
	$FuelBar.max_value = MAX_FUEL
	set_fuel_bar ()

func set_fuel_bar () -> void:
	$FuelBar.value = fuel
	
func set_fuel_label() -> void:
	$FuelLabel.text = "Distance: %s" % fuel

#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("ui_accept"):
#		damage()
#		

func damage():
	#$Altitude
	fuel +=1
	if fuel<0 || fuel == 10:
		node.fullfuel()
		fuel = MAX_FUEL
	elif fuel<6 && fuel > 3:
		node.midfuel()   
	elif fuel<3:
		node.lowfuel()

	set_fuel_label()
	set_fuel_bar()


func _on_timer_timeout():
	fuel +=1
	if fuel == 7:
		node.fullfuel()

	elif fuel<6 && fuel > 3:
		node.midfuel()   
	elif fuel<3:
		node.lowfuel()
	elif fuel > MAX_FUEL:
		fuel = 0
	set_fuel_label()
	set_fuel_bar()


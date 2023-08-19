extends Node2D
const MAX_HEALTH = 10
var health = MAX_HEALTH


@onready var node = get_node("HealthBar")
func _ready() -> void:
	set_health_label ()
	$HealthBar.max_value = MAX_HEALTH
	set_health_bar ()

func set_health_bar () -> void:
	$HealthBar.value = health
	
func set_health_label() -> void:
	$HealthLabel.text = "Health: %s" % health

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		damage()
		

func damage():
	$HealthBar
	health -=1
	if health<0 || health == 10:
		node.fullhealth()
		health = MAX_HEALTH
	elif health<6 && health > 3:
		node.midhealth()
		print("we made it here")
	elif health<3:
		node.lowhealth()

	set_health_label()
	set_health_bar()

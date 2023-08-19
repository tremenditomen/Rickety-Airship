extends Node2D
const MAX_HEALTH = 10
var health = MAX_HEALTH

func _ready() -> void:
	print("hello")
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
	if health<0:
		health = MAX_HEALTH
	set_health_label()
	set_health_bar()

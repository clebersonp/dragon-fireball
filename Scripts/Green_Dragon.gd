#Green Dragon
extends Sprite

const FIREBALL_SCENE = preload("res://Mini Scenes/Fireball.tscn")
const SPEED = 200
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)	
	
func _process(delta):
	var speed_y = 0
	
	if Input.is_action_pressed("ui_up"):
		speed_y = -SPEED
	
	elif Input.is_action_pressed("ui_down"):
		speed_y = SPEED
		
	set_position(get_position() + Vector2(0, speed_y * delta))
	
	if Input.is_action_pressed("ui_accept"):
		if timer.get_time_left() == 0:
			createFireball()
			restart_timer()
		
func createFireball():
	var fireball_scene = FIREBALL_SCENE.instance()
	fireball_scene.set_position(get_node("Position2D").get_global_position())
	get_parent().add_child(fireball_scene)
	
func restart_timer():
	timer.set_wait_time(1)
	timer.start()
		
func _on_Timer_timeout():
	timer.stop()

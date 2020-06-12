extends Area2D

const FIREBALL_SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var speed_x = 1
	var speed_y = 0
	var motion = Vector2(speed_x, speed_y) * FIREBALL_SPEED
	set_position(get_position() + motion * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_area_entered(area):
	var name = area.get_name()
	if name.begins_with("Red Dragon"):
		area.queue_free()
	queue_free()

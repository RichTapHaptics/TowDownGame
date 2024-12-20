@tool
extends TextureRect

var rotation_speed = PI

func _ready() -> void:
	set_process(false)
	Utils.onGameStart.connect(self.onGameStart)

func onGameStart():
	set_process(true)
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
	global_position = get_global_mouse_position() - size  / 2
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			global_position = event.position - size  / 2
			#PlayerData.sendWeaponShoot()
			print("Touch began at: ", global_position, " with index: ", event.index)
		else:
			print("Touch ended with index: ", event.index)

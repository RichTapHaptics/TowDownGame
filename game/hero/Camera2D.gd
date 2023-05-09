extends Camera2D

var is_shake = false

var center_horizontal = false
var center_vertical = false
var center_horizontal_pos:int
var center_vertical_pos:int


func _process(_delta:float)->void :
	if Engine.get_process_frames() % 3 == 0:
		var target_pos = Utils.player.global_position
		var camera_pos = get_global_transform().origin
		var distance = get_global_mouse_position().distance_to(camera_pos)
		var max_distance = 15  # 最大距离
		var max_offset = 5  # 最大偏移量
		var t = distance / max_distance  # 计算插值系数
		var new_offset = (get_global_mouse_position() - camera_pos).normalized() * max_offset * t  # 计算相机的偏移量
		
		#var x = int(lerp(position.x,new_offset.x,0.05))
		#var y = int(lerp(position.y,new_offset.y,0.05))
		position = new_offset
		Utils.player.light2d.offset = new_offset
	if center_horizontal:
		global_position.x = center_horizontal_pos
	if center_vertical:
		global_position.y = center_vertical_pos

func _ready():
	add_to_group("camera")

func shootShake(_step):
	if is_shake:
		return
	is_shake = true
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self,"offset",_step,0.1)
	tween.tween_property(self,"offset",Vector2.ZERO,0.1)
	tween.tween_callback(func end():
		is_shake = false)
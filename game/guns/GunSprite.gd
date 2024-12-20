extends "res://game/guns/BaseGun.gd"

func _shoot():
	print("GunSprite _shoot:")
	if (OS.get_name() == "Window"):
		var mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - gun_tip.global_position).normalized()
	gun_tip.rotation = direction.angle()
	var b = bullet_scene.instantiate()
	b.setOnwer(player)
	get_tree().root.add_child(b)
	b.position = gun_tip.global_position
	#if(OS.get_name() == "Android"):
		##var direction2 = Input.get_gravity().normalized()
		##print("GunSprite ",direction2.x,direction2.y,direction2.z)
		##var direct  = Vector2(direction2.x,direction2.z)
		##print("GunSprite ",direct.angle())
		##b.rotation = direct.angle()
	#else:
	b.rotation = gun_tip.rotation
	fire(b)
	call_deferred("_shootAnim")
	can_shoot = false
	timer.start()

func _shootAnim():
	super._shootAnim()
	audio.play()
	#haptic.playHaptic()
	print("GunSprite _shootAnim heContent: 成功")

	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "position", position, timer.wait_time).from(position + Vector2(-1, -1))
	tween.tween_property($Sprite2D, "scale", Vector2(1,1), timer.wait_time).from(Vector2(0.5, 1.1))

func _on_timer_timeout():
	can_shoot = true

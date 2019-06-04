extends Sprite




# Called when the node enters the scene tree for the first time.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		$Tween.interpolate_property(self, "position", position, Vector2(464,mouse_pos.y), 0.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
		$Tween.start()
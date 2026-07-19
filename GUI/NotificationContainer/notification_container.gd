extends Control
@onready var notification_label: Label = $MarginContainer/NotificationLabel

func _on_level_manager_checkpoint_reached(position) -> void:
	notification_label.text = "Checkpoint Reached"
	show()
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0, 500),0)
	tween.tween_property(self, "position", Vector2(0, 0),0.5)
	tween.tween_property(self, "position", Vector2(0, 0),2)
	tween.tween_property(self, "position", Vector2(0, 500),.5)
	
	await tween.finished
	hide()
	pass # Replace with function body.

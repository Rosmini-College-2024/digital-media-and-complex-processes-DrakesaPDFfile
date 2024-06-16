extends Node2D

@onready var line_edit = $ColorRect/LineEdit
signal get_name(name)

func _ready():
	line_edit.grab_focus()


func _on_button_pressed():
	emit_signal("get_name", line_edit.text)
	queue_free()

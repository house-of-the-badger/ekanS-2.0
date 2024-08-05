class_name PauseMenu extends CanvasLayer

const tutorial_scene:PackedScene = preload("res://menus/tutorial.tscn")


@onready var resume: Button = %ResumeButton
@onready var restart: Button = %RestartButton

func _on_resume_button_pressed():
	queue_free()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _notification(what):
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false


func _on_settings_pressed():
	queue_free()
	var tutorial = tutorial_scene.instantiate()
	get_parent().add_child(tutorial)

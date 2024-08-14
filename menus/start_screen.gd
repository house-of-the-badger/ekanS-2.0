class_name StartScreen extends CanvasLayer

const gameplay_scene:PackedScene = preload("res://gameplay/gameplay.tscn")
const tutorial_scene:PackedScene = preload("res://menus/tutorial.tscn")

@onready var score: Label = %ScoreLabel
@onready var start: Button = %StartButton
@onready var quit = %QuitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#start.pressed.connect(_on_start_button_pressed)
	var high_score:int = Global.save_data.high_score
	score.text = "High Score: " + str(high_score)

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(gameplay_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_tutorial_pressed():
	var tutorial = tutorial_scene.instantiate()
	get_parent().add_child(tutorial)


func _on_signup_button_pressed():
	get_tree().change_scene_to_file("res://menus/sign-up.tscn")


func _on_login_button_pressed():
	get_tree().change_scene_to_file("res://menus/Login.tscn")

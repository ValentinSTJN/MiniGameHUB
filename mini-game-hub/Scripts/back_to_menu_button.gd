extends Button
class_name BackToMenuButton

# If you prefer a dynamic reference, please copy the code related to
# variable @export var target_scene: PackedScene in game_button.gd
const MAIN_MENU_SCENE := "res://Scenes/MainMenu.tscn"

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)

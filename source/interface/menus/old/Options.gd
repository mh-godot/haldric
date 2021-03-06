extends Control

var sizes := [
	Vector2(1280, 720),
	Vector2(1720, 720),
	Vector2(1920, 1080),
	Vector2(2560, 1080),
	Vector2(2560, 1440),
	Vector2(3440, 1440),
	Vector2(3840, 2160),
]

onready var resolutions :=\
		$CenterContainer/VBoxContainer/HBoxContainer/OptionButton\
		as OptionButton

func _ready() -> void:
	resolutions.add_item("720p (16:9)", 0)
	resolutions.add_item("720p (21:9)", 1)
	resolutions.add_item("1080p (16:9)", 2)
	resolutions.add_item("1080p (21:9)", 3)
	resolutions.add_item("1440p (16:9)", 4)
	resolutions.add_item("1440p (21:9)", 5)
	resolutions.add_item("2160p (16:9)", 6)

func _on_Save_pressed() -> void:
	var new_resolution: Vector2 = sizes[resolutions.get_selected_id()]
	ProjectSettings.set("display/window/size/height", new_resolution.y)
	ProjectSettings.set("display/window/size/width", new_resolution.x)

	if ProjectSettings.save() != OK:
		print("Failed to save project settings")

func _on_Back_pressed() -> void:
	Scene.change(Scene.TitleScreen)

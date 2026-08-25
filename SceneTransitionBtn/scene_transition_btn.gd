class_name SceneTransitionBtn
extends Button

@export_file("*.tscn") var scene_path

func _ready() -> void:
	hide()

func _on_next_level_pressed() -> void:
	GlobalAudioManager.play_sfx(0)
	GlobalTransition.change_scene_to(scene_path)
	

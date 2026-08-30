class_name SceneTransitionBtn
extends Button

@export_file("*.tscn") var scene_path

@export var success_btn = false

func _ready() -> void:
	pass
	#hide()


func _on_pressed() -> void:
	if success_btn:
		GlobalAudioManager.play_sfx(3)
	else:
		GlobalAudioManager.play_sfx(0)
	GlobalTransition.change_scene_to(scene_path)

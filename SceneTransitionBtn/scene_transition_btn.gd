class_name SceneTransitionBtn
extends Button

@export_file("*.tscn") var scene_path

func _ready() -> void:
	pass
	#hide()


func _on_pressed() -> void:
	GlobalTransition.change_scene_to(scene_path)

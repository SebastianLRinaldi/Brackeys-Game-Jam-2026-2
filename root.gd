extends Node2D

@onready var scene_select: ItemList = %SceneSelect

var scene_paths: Array[String] = [
	
	"res://seb_test/test_A.tscn"
	
	]

func _ready() -> void:
	for path in scene_paths:
		scene_select.add_item(path)


func _on_scene_select_item_activated(index: int) -> void:
	var selected_path = scene_select.get_item_text(index)
	GlobalTransition.change_scene_to(selected_path)
	print("Selected: ", selected_path)

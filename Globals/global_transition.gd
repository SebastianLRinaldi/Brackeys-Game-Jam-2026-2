extends Node2D
@onready var transition_player: AnimationPlayer = %TransitionPlayer


var scene_to_load

func change_scene_to(scene_path: String) -> void:
	scene_to_load = scene_path
	#transition_player.play("close")
	#get_tree().paused = true
	_load_new_scene()
	print("closed_pre_scene")
	
	

func _load_new_scene() -> void:
	#transition_player.play("open")
	get_tree().call_deferred("change_scene_to_file", scene_to_load)
	#var tween = create_tween()
	#tween.tween_interval(1.0)
	#await tween.finished
	#get_tree().paused = false
	print("OPEN_new_scene")
	

class_name InteractArea
extends Area2D


@export var action_name: String = "interact"

#var interact: Callable = func():
	#pass

signal interacted


func _on_body_entered(body):
	InteractManager.register_area(self)


func _on_body_exited(body):
	InteractManager.unregister_area(self)
	GlobalDialogManager.player_left_interact_area()
	

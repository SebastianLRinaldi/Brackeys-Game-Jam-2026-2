extends Area2D
class_name IntractArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass


func _on_body_entered(body):
	pass
	#InteractManager.register_area(self)


func _on_body_exited(body):
	pass
	#InteractManager.unregister_area(self)

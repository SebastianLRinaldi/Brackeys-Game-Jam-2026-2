class_name Fridge
extends StaticBody2D

@export var object_name = ""
@onready var interact_area: InteractArea = %InteractArea
@onready var dialog_label: Label = %DialogLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interact_area.action_name = "get sandwich"

func _on_interact_area_interacted() -> void:

	dialog_label.show()
	var dia_text = GlobalDialogManager.player_interacted_with(object_name)
	
	var tween = create_tween()
	tween.tween_property(dialog_label, "text", dia_text, 1.0).from("")


func _on_interact_area_body_exited(body: Node2D) -> void:
	dialog_label.hide()

class_name Desk
extends StaticBody2D

@export var npc_name = ""
@onready var interact_area: InteractArea = %InteractArea
@onready var dialog_label: Label = %DialogLabel
@onready var npc_sprite_2d: AnimatedSprite2D = $NPCSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_label.hide()
	if npc_name:
		interact_area.action_name = "interact with " + npc_name
	
	match npc_name:
		"Dave":
			npc_sprite_2d.frame = 10
		"Grace":
			npc_sprite_2d.frame = 5
		"Mike":
			npc_sprite_2d.frame = 2
		"Sarah":
			npc_sprite_2d.frame = 4
		"Boss":
			npc_sprite_2d.frame = 11
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_area_interacted() -> void:
	if npc_name:
		dialog_label.show()
		var dia_text = GlobalDialogManager.player_interacted_with(npc_name)
		
		var tween = create_tween()
		tween.tween_property(dialog_label, "text", dia_text, 1.0).from("")


func _on_interact_area_body_exited(body: Node2D) -> void:
	dialog_label.hide()

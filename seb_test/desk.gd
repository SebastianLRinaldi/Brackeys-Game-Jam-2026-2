class_name Desk
extends StaticBody2D

@export var npc_name = ""
@onready var interact_area: InteractArea = %InteractArea
#@onready var dialog_label: Label = %DialogLabel
@onready var npc_sprite_2d: AnimatedSprite2D = $NPCSprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
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
		"HR":
			npc_sprite_2d.frame = 6
		"Fail":
			npc_sprite_2d.frame = 11
			interact_area.action_name = "interact with Boss"
		"Success":
			npc_sprite_2d.frame = 11
			interact_area.action_name = "interact with Boss"
			
		_:
			print('UNKNOWN NPC AT DESK')
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_area_interacted() -> void:
	if npc_name:
		GlobalDialogManager.player_interacted_with(npc_name)

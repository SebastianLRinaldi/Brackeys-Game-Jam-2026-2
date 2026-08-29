class_name Desk
extends StaticBody2D

@export var npc_name = ""
@onready var interact_area: InteractArea = %InteractArea
@onready var dialog_label: Label = %DialogLabel
@onready var npc_sprite_2d: AnimatedSprite2D = $NPCSprite2D



var LETTER_TIME = 0.04
var PUNCTUATION_TIME = 0.3
var tween:Tween
var dialogue_idx:int = 0




func say(text:String):
	if tween: tween.kill()
	tween = create_tween ()

	dialog_label.text = text
	dialog_label.visible_characters = 0

	var index := 0
	var last_punct_index := 0
	var text_length = dialog_label.text.length()

	for letter in dialog_label.text:
		index+=1

		# only add a MethodTweener at punctuations or end of string
		if not(letter in [".", "?", "!", ", "] or index == text_length):
			continue

		# reveal letters between the last punctuation and the current one
		var duration = (index-last_punct_index) * LETTER_TIME
		tween. tween_method(_reveal_char, last_punct_index, index, duration)

		# wait a bit after commas and punctuation
		if letter == ",": tween.tween_interval (PUNCTUATION_TIME/2.0)
		else: tween. tween_interval (PUNCTUATION_TIME)

		last_punct_index = index

# method called every frame by the MethodTweener
func _reveal_char(v:int):
	if dialog_label.visible_characters == v:return
	dialog_label.visible_characters = v
	#audio_stream_player.play()




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
		var dialog_lines = GlobalDialogManager.player_interacted_with(npc_name)
		
		say(dialog_lines[dialogue_idx])
		if dialog_lines.get(dialogue_idx + 1):
			dialogue_idx += 1
		else:
			dialogue_idx = 0


func _on_interact_area_body_exited(body: Node2D) -> void:
	dialog_label.hide()

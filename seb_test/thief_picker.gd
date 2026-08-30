extends Control
@onready var npc_list: ItemList = %NpcList
@export_file("*.tscn") var good_talk_scene_path
@export_file("*.tscn") var bad_talk_scene_path

var npcs: Array[String] = [
	
	"Dave", "Grace", "Mike", "Sarah", "Boss"
	
	]

func _ready() -> void:
	for npc in npcs:
		var npc_idx = npc_list.add_item(npc)
		var tooltip_msg = ""
		if npc == "Boss":
			tooltip_msg = "Double Click the " + npc + " to report to HR"
		else:
			tooltip_msg = "Double Click " + npc + " to report to HR"
		
		npc_list.set_item_tooltip(npc_idx, tooltip_msg)


func _on_npc_list_item_activated(index: int) -> void:
	var selected_thief = npc_list.get_item_text(index)
	#GlobalTransition.change_scene_to(selected_path)
	print("Selected as thief: ", selected_thief)
	if selected_thief == "Boss":
		GlobalTransition.change_scene_to(good_talk_scene_path)
	else:
		GlobalTransition.change_scene_to(bad_talk_scene_path)
	
	


func _on_npc_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	pass


func _on_npc_list_item_selected(index: int) -> void:
	GlobalAudioManager.play_sfx(2)

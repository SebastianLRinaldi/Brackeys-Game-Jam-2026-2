extends Control
@onready var npc_list: ItemList = %NpcList


var npcs: Array[String] = [
	
	"Dave", "Grace", "Mike", "Sarah", "Boss"
	
	]

func _ready() -> void:
	for npc in npcs:
		var npc_idx = npc_list.add_item(npc)
		var tooltip_msg = ""
		if npc == "Boss":
			tooltip_msg = "Did the " + npc + " steal my sandwhich?"
		else:
			tooltip_msg = "Did " + npc + " steal my sandwhich?"
		
		npc_list.set_item_tooltip(npc_idx, tooltip_msg)



func _on_npc_list_item_activated(index: int) -> void:
	var selected_thief = npc_list.get_item_text(index)
	#GlobalTransition.change_scene_to(selected_path)
	print("Selected: ", selected_thief)

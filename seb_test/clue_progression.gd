extends Node2D


var current_narrative_options = 0

var narrative = {
	
	0:[true, false, false, false, false],
	1:[false, true, false, false, false],
	2:[false, false, true, false, false],
	3:[false, false, false, true, false],
	4:[false, false, false, false, true],
	
}


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test_key0"):
		check_narrative(0)
	elif event.is_action_pressed("test_key1"):
		check_narrative(1)
	elif event.is_action_pressed("test_key2"):
		check_narrative(2)
	elif event.is_action_pressed("test_key3"):
		check_narrative(3)
	elif event.is_action_pressed("test_key4"):
		check_narrative(4)

func check_narrative(npc_idx:int):
	var char_dia = narrative.get(current_narrative_options)
	print(npc_idx, char_dia[npc_idx])
	
	if char_dia[npc_idx]:
		current_narrative_options += 1
		print("CORRECT CLUE")
	
	
	
	
	

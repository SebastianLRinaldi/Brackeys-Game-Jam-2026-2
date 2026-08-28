extends Node2D


var current_narrative_options = 0

var narrative = {
	
	0:["I had the correct clue", "I can't help you rn", "I can't help you rn", "I can't help you rn", "I can't help you rn"],
	1:["I can't help you rn", "I had the correct clue", "I can't help you rn", "I can't help you rn", "I can't help you rn"],
	2:["I can't help you rn", "I can't help you rn", "I had the correct clue", "I can't help you rn", "I can't help you rn"],
	3:["I can't help you rn", "I can't help you rn", "I can't help you rn", "I had the correct clue", "I can't help you rn"],
	4:["I can't help you rn", "I can't help you rn", "I can't help you rn", "I can't help you rn", "I had the correct clue"],
		
}


"""
story chp --> specific npc/object we are interacting with --> thier line(s) for this chapter

"""

## Some key stuff
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("testkey1"):
		check_narrative(0)
	elif event.is_action_pressed("testkey2"):
		check_narrative(1)
	elif event.is_action_pressed("testkey3"):
		check_narrative(2)
	elif event.is_action_pressed("testkey4"):
		check_narrative(3)
	elif event.is_action_pressed("testkey5"):
		check_narrative(4)

func check_narrative(npc_idx:int):
	var char_dia = narrative.get(current_narrative_options)
	print(npc_idx, char_dia[npc_idx])
	
	if char_dia[npc_idx] == "I had the correct clue":
		current_narrative_options += 1
		print("CORRECT CLUE")
	
	
	
	
	

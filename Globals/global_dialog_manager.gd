extends Node2D


#var narrative = {
	#
	#0:["I had the correct clue", "I can't help you rn", "I can't help you rn", "I can't help you rn", "I can't help you rn"],
	#1:["I can't help you rn", "I had the correct clue", "I can't help you rn", "I can't help you rn", "I can't help you rn"],
	#2:["I can't help you rn", "I can't help you rn", "I had the correct clue", "I can't help you rn", "I can't help you rn"],
	#3:["I can't help you rn", "I can't help you rn", "I can't help you rn", "I had the correct clue", "I can't help you rn"],
	#4:["I can't help you rn", "I can't help you rn", "I can't help you rn", "I can't help you rn", "I had the correct clue"],
		#
#}

var chapter_num = 1

var narrative = {
	1: {
		"Fridge": {
			"lines": ["Who Stole my sandwich?!", "Someone will get fired over this", "..."],
			"key_to_next_chapter": false
		},
		
		"Dave": {
			"lines": ["Hey Bob!", "Someone stole your sandwich?", "I might of seen",  "MIKE, SARAH, and the BOSS", "eatting a sandwich", "That's all I know."],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["How you doing Bob!", "Someone stole your sandwich?", "I think I saw", "DAVE, MIKE, and the BOSS", "eatting near the time it went missing", "That's all I know."],
			"key_to_next_chapter": false
		},
		"Mike": {
			"lines": ["Good to see ya Bob!", "Someone stole your sandwich?", "I saw", "DAVE and GRACE", "eat out of their own lunchboxes", "That's all I know."],
			"key_to_next_chapter": false
		},
		"Sarah": {
			"lines": ["Anything I can help you with?", "Someone stole your sandwich?", "If I had to guess...", "DAVE, GRACE, or MIKE could have stole it", "That's all I know."],
			"key_to_next_chapter": false
		},
		"Boss": {
			"lines": ["Hello Bob.", "Someone took your sandwich?", "That's a shame",  "I didn't see anything though",  "as I went out for lunch", "That's all I know."],
			"key_to_next_chapter": false
		}
	},
	2: {
		"Dave": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["I have the clue"],
			"key_to_next_chapter": true
		},
		"Mike": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Sarah": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Boss": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		}
	},
	3: {
		"Dave": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Mike": {
			"lines": ["I have the clue"],
			"key_to_next_chapter": true
		},
		"Sarah": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Boss": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		}
	},
	4: {
		"Dave": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Mike": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Sarah": {
			"lines": ["I have the clue"],
			"key_to_next_chapter": true
		},
		"Boss": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		}
	},
	5: {
		"Dave": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Mike": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Sarah": {
			"lines": ["I can't help you right now"],
			"key_to_next_chapter": false
		},
		"Boss": {
			"lines": ["I have the clue"],
			"key_to_next_chapter": true
		}
	}
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func player_interacted_with(objects_name: String) -> Array:
	if not narrative.get(chapter_num):return []
	if not objects_name in narrative.get(chapter_num):return []
	#print("Chapter #: ", chapter_num)
	#print(narrative.get(chapter_num).get(objects_name).get("lines")[0])
	var dia_lines = narrative.get(chapter_num).get(objects_name).get("lines")
	
	if narrative.get(chapter_num).get(objects_name).get("key_to_next_chapter"):
		pass
	
	
		#chapter_num += 1
	
	return dia_lines
		

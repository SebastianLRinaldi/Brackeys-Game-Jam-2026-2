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
			"lines": ["Who Stole my sandwich!?"],
			"key_to_next_chapter": false
		},
		
		"Dave": {
			"lines": ["I saw MIKE, SARAH, and the BOSS eat a sandwich"],
			"key_to_next_chapter": false
		},
		"Grace": {
			"lines": ["I saw DAVE, MIKE, and the BOSS eat near the time it went missing "],
			"key_to_next_chapter": false
		},
		"Mike": {
			"lines": ["I saw DAVE, and GRACE eat out of their own lunchboxes "],
			"key_to_next_chapter": false
		},
		"Sarah": {
			"lines": ["I saw either DAVE, GRACE,or MIKE steal it"],
			"key_to_next_chapter": false
		},
		"Boss": {
			"lines": ["I didn't see anything as I went out for lunch"],
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

func player_interacted_with(objects_name: String) -> String:
	if not narrative.get(chapter_num):return "..."
	if not objects_name in narrative.get(chapter_num):return "..."
	print("Chapter #: ", chapter_num)
	print(narrative.get(chapter_num).get(objects_name).get("lines")[0])
	var text = narrative.get(chapter_num).get(objects_name).get("lines")[0]
	
	if narrative.get(chapter_num).get(objects_name).get("key_to_next_chapter"):
		chapter_num += 1
	
	return text
		

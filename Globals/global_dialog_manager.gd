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


var current_interact_name = null
var prev_interact_name = null

var dialog_label = null
var name_label = null 
var end_char_label = null
var dialog_container = null
var thief_picker = null
var good_path_btn = null
var bad_path_btn = null

var chapter_num = 1

var narrative = {

  "Fridge": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "Another Bleak day at Propeller Hat Co."
	  },
	  {
		"speaker": "BOB",
		"text": "I Put My Cig out and head for the lunch room"
	  },
	  {
		"speaker": "BOB",
		"text": "Finally I can catch a break in this cold hard boiled world"
	  },
	  {
		"speaker": "BOB",
		"text": "I’ve got my favorite sandwich the wife packed me for grub"
	  },
	  {
		"speaker": "BOB",
		"text": "But as I open the lunch pail I brought from home"
	  },
	  {
		"speaker": "BOB",
		"text": "It's Gone!!"
	  },
	  {
		"speaker": "BOB",
		"text": "There could only be one reason for this…"
	  },
	  {
		"speaker": "BOB",
		"text": "A thief!!"
	  },
	  {
		"speaker": "BOB",
		"text": "One of these no good two timen’ yuppies stole my sandwich and are going to pay for it."
	  },
	  {
		"speaker": "BOB",
		"text": "Ive gotta put on the proverbial gumshoe hat and track them down."
	  },
	  {
		"speaker": "BOB",
		"text": "I’ll ask around the office to see if I can spot any discrepancies in their stories."
	  },
	  {
		"speaker": "BOB",
		"text": "But I know one of them has been hitting the bottle and can't tell truth from fiction."
	  },
	  {
		"speaker": "BOB",
		"text": "And of course that no good thief won't tell the truth neither"
	  },
	  {
		"speaker": "BOB",
		"text": "That means two of the five are telling tall tales while 3 are making no bones ‘bout it"
	  },
	  {
		"speaker": "BOB",
		"text": "Iv’e gotta track down the thief and let the big man know else they’ll keep takin’ what's not theirs"
	  },
	  {
		"speaker": "BOB",
		"text": "And if I get the wrong sucker…"
	  },
	  {
		"speaker": "BOB",
		"text": "I’ll be toast."
	  },
	  {
		"speaker": "BOB",
		"text": "E to interact with people in the office"
	  },
		  {
		"speaker": "BOB",
		"text": "WASD or Arrow keys to move around the office"
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Dave": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "My Sandwich been stolen. You got any leads?"
	  },
	  {
		"speaker": "DAVE",
		"text": "Well I saw Mike, Sarah, and the big Boss man eating a sandwich so maybe it's one of them?"
	  },
	  {
		"speaker": "BOB",
		"text": "Hmmmm so if Dave is tellin’ the truth that means one of those three took it"
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Grace": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "My lunch’s missing!"
	  },
	  {
		"speaker": "BOB",
		"text": "I don't suppose you've seen who’s been eating in the lunch room before now have you?"
	  },
	  {
		"speaker": "GRACE",
		"text": "Well I did see Dave, Mike, and the Boss eating while you were on your smoke break."
	  },
	  {
		"speaker": "BOB",
		"text": "Hmm then if she’s sober and not the thief herself it must be Dave, Mike, or the Boss."
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Mike": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "Hey Mike… I don't suppose you’ve seen anyone eating out of my lunch box have you?"
	  },
	  {
		"speaker": "MIKE",
		"text": "Nope But I know I saw Dave eat from their own lunch box"
	  },
	  {
		"speaker": "MIKE",
		"text": "and Grace still hasn’t eaten."
	  },
	  {
		"speaker": "BOB",
		"text": "So long as Mike is truthin’ then it can't be Grace or Dave."
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Sarah": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "Someones stolen my lunch Sarah, any ideas?"
	  },
	  {
		"speaker": "SARAH",
		"text": "Well I saw Dave, Grace, and Mike looking awfully suspicious earlier."
	  },
	  {
		"speaker": "SARAH",
		"text": "I would say it’s got to be one of them three"
	  },
	  {
		"speaker": "BOB",
		"text": "Hmmmm, So if I’m to trust Sarah its gotta be one of those three."
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Boss": {
	"lines": [
	  {
		"speaker": "BOSS",
		"text": "Hey Bob whats Crackin’"
	  },
	  {
		"speaker": "BOB",
		"text": "Someones stolen my lunch Boss, You know anything about it?"
	  },
	  {
		"speaker": "BOSS",
		"text": "Well unfortunately I was eatin’ steak and lobster at the diner down the street so I didn’t see anything."
	  },
	  {
		"speaker": "BOSS",
		"text": "But let me know if you find ‘em and I’ll give them a stern talking to."
	  },
	  {
		"speaker": "BOB",
		"text": "So the Boss wasn’t in the office huh?"
	  },
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },


 "HR": {
		"lines": [
		  {
			"speaker": "BOB",
			"text": "I would like to report a very serious issue!"
		  },
		  {
			"speaker": "HR LARY",
			"text": "Oh I see..."
		  },
		  {
			"speaker": "HR LARY",
			"text": "Well what would you like to report?"
		  },
		  {
			"speaker": "BOB",
			"text": "I want to report someone for stealing my lunch!"
		  },
		  {
			"speaker": "HR LARY",
			"text": "Who do you think stole your lunch?"
		  },
		
		  {
			"speaker": "",
			"text": ""
		  }
		]
	},

  "Fail": {
	"lines": [
	  {
		"speaker": "BOSS",
		"text": "I’m sorry to do this Bob but I've gotta let you go. Spreadin’ lies like this will only throw off everyone's work and you don’t even have any proof."
	  },
	  {
		"speaker": "BOB",
		"text": "But…"
	  },
	  {
		"speaker": "BOSS",
		"text": "I’m sorry Bob."
	  },
	  {
		"speaker": "GAME",
		"text": "Bob was fired for false allegation"
	  },
	
	  #{
		#"speaker": "GAME",
		#"text": "You failed to catch the Purp. Try again?"
	  #},
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  },

  "Success": {
	"lines": [
	  {
		"speaker": "BOB",
		"text": "I knew it was you Boss Man"
	  },
	  {
		"speaker": "BOSS",
		"text": "What!!! Well you dont even have any proof do you!"
	  },
	  {
		"speaker": "BOB",
		"text": "Your story doesn't line up, You said you went out for lunch… But Dave and Grace both saw you eating here"
	  },
	  {
		"speaker": "BOSS",
		"text": "But Sarah said she saw the others actin’ shifty what about them?"
	  },
	  {
		"speaker": "BOB",
		"text": "Sorry Boss man, Everyone knows Sarah's been on the drink ever since the incident… Can’t trust a word out of her mouth."
	  },
	  {
		"speaker": "GAME",
		"text": "The Boss was fired for stealing your sandwich"
	  },
	  #{
		#"speaker": "GAME",
		#"text": "You successfully to caught the sandwich thief. Nice job! Thanks for Playing!"
	  #},
	  {
		"speaker": "",
		"text": ""
	  }
	],
	"key_to_next_chapter": false
  }
}




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
		tween.tween_method(_reveal_char, last_punct_index, index, duration)

		# wait a bit after commas and punctuation
		if letter == ",": tween.tween_interval (PUNCTUATION_TIME/2.0)
		else: tween.tween_interval (PUNCTUATION_TIME)

		last_punct_index = index
	
	#tween.tween_interval(0.5)
# method called every frame by the MethodTweener
func _reveal_char(v:int):
	if dialog_label.visible_characters == v:return
	dialog_label.visible_characters = v
	#audio_stream_player.play()





func skip_or_next_dialog_line():
	#print("current_interact_name: ", current_interact_name)
	
	
	var dialog_lines = narrative.get(current_interact_name).get("lines")
	
	#print("dialog_lines: ", dialog_lines)
	
	var idx_size = dialog_lines.size() -1
	if tween and tween.is_running():
		tween.kill()
		dialog_label.visible_characters = -1
		end_char_label.text = "E"
	else:
		var speaking_character = dialog_lines[dialogue_idx].get("speaker")
		
		if speaking_character == "":
			hide_dialog()
			dialogue_idx = 0
		
		else:
			var speaking_character_line = dialog_lines[dialogue_idx].get("text")
			
				
			
			#print("speaking_character: ", speaking_character)
			#print("speaking_character_line: ", speaking_character_line)
			end_char_label.text = ""
			name_label.text = speaking_character
			
			say(speaking_character_line)
			
			if dialogue_idx >= idx_size:
				dialogue_idx = 0
			else:
				dialogue_idx += 1
			
			if speaking_character_line == "Who do you think stole your lunch?":
				thief_picker.show()
			
			if speaking_character_line == "The Boss was fired for stealing your sandwich":
				good_path_btn.show()
			
			if speaking_character_line == "Bob was fired for false allegation":
				bad_path_btn.show()
			
			
			await tween.finished
			end_char_label.text = "E"
			




func player_interacted_with(objects_name: String):
	if not objects_name in narrative.keys():return
	
	if prev_interact_name != objects_name:
		dialogue_idx = 0
	
	
	
	#print("Chapter #: ", chapter_num)
	#print(narrative.get(chapter_num).get(objects_name).get("lines")[0])
	current_interact_name = objects_name
	show_dialog()
	skip_or_next_dialog_line()
	prev_interact_name = current_interact_name


func hide_dialog():
	dialog_container.hide()

func show_dialog():
	dialog_container.show()

func player_left_interact_area():
	thief_picker.hide()
	dialog_container.hide()
	if tween: tween.kill()
	dialogue_idx = 0
	

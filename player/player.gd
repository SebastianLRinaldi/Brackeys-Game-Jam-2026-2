extends CharacterBody2D

@onready var thief_picker: Control = %ThiefPicker
@onready var name_label: Label = %NameLabel
@onready var dialog_label: Label = %DialogLabel
@onready var end_char_label: Label = %EndCharLabel
@onready var dialog_container: MarginContainer = $DialogContainer


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	InteractManager.player = self
	thief_picker.hide()
	GlobalDialogManager.thief_picker = self.thief_picker
	GlobalDialogManager.name_label = self.name_label
	GlobalDialogManager.dialog_label = self.dialog_label
	GlobalDialogManager.end_char_label = self.end_char_label
	GlobalDialogManager.dialog_container = self.dialog_container
	dialog_container.hide()


func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var direction_v := Input.get_axis("ui_up", "ui_down")
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

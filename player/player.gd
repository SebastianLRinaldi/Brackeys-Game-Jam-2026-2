extends CharacterBody2D

@onready var thief_picker: Control = %ThiefPicker
@onready var name_label: Label = %NameLabel
@onready var dialog_label: Label = %DialogLabel
@onready var end_char_label: Label = %EndCharLabel
@onready var dialog_container: MarginContainer = $DialogContainer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 280.0
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

var animation_direction: String = "down"
var animation_state: String = ""

var acceleration = 10.0

func update_sprite_direction(input: Vector2) -> void:
	match input:
		Vector2.DOWN:
			animation_direction = "down"
		Vector2.UP:
			animation_direction = "up"
		Vector2.RIGHT:
			animation_direction = "right"
		Vector2.LEFT:
			animation_direction = "left"

func update_sprite() -> void:
	if velocity.length() > 0:
		animation_state = "walk_"
	else:
		animation_state ="idle_"

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")

	update_sprite_direction(direction)
	update_sprite()
	var animation_to_run = animation_state+animation_direction
	print(animation_to_run)
	animated_sprite_2d.play(animation_to_run)

	velocity = direction * SPEED

	move_and_slide()



	#velocity.x = move_toward(velocity.x, direction.x*SPEED, acceleration)
	#velocity.y = move_toward(velocity.y, direction.y*SPEED, acceleration)
#
	#move_and_collide(velocity*delta)

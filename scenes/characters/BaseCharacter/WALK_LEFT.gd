extends Node2D

export var character_path := NodePath("../..")
onready var character: KinematicBody2D = get_node(character_path)

func validate(input_buffer: Array, delta: float) -> bool:
	
	# If input buffer is empty, don't activate.
	if input_buffer.size() <= 0:
		return false
	
	# If there is a left-pressed input before a left-released input, activate.
	for input in input_buffer:
		if input.mode == 0 and input.action == "left":
			return false
		if input.mode == 1 and input.action == "left":
			return true
	
	return false

func activate(input_buffer: Array, delta: float):
	character.apply_movement(Vector2.LEFT)

extends Node2D

class_name MainCharacter

@onready var body : CharacterBody2D = $CharacterBody2D

func _ready() -> void:
	body.set_collision_layer_value(1, true)

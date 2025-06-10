extends Area2D

class_name OverlapArea

@export var unique_id : int
@onready var label = $RichTextLabel

func getUniqueId() -> int:
	return unique_id

func _ready() -> void:
	set_collision_mask_value(1, true)
	label.text = str(unique_id)

func _getOverlaps():
	var overlaps : Array[Node2D] = get_overlapping_bodies()
	if(overlaps.size() > 0):
		print(str(unique_id) + " has # overlaps: " + str(overlaps.size()))

func _process(delta: float) -> void:
	_getOverlaps()

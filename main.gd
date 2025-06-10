extends Node2D

var character : MainCharacter = null

@onready var area0 = $OverlapArea0
@onready var area1 = $OverlapArea1
@onready var area2 = $OverlapArea2

func _process(_delta : float):
	queue_redraw()

func _draw():
	draw_line(Vector2(-50.0, 0.0), Vector2(50.0, 00.0), Color.RED, 3.0)
	draw_line(Vector2(0.0, -50.0), Vector2(0.0, 50.0), Color.BLUE, 3.0)

func _getOverlaps():
	var overlaps : Array[Node2D] = area1.get_overlapping_bodies()
	print(overlaps.size())

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_Q:
			_getOverlaps()
		elif event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
			if character == null:
				var resource : Resource = load("res://character.tscn")
				character = resource.instantiate()
				add_child(character)
				character.position = get_local_mouse_position()
			if character != null:
				character.position = get_local_mouse_position()
		elif event.button_index == MOUSE_BUTTON_RIGHT && event.is_pressed():
			if character != null:
				character.queue_free()

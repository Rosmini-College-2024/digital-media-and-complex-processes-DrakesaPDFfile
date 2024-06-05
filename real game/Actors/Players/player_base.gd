extends "res://Actors/Character/character.gd"

var background_tiles = null
var velocitymap = Vector2()
var count = 0

func _ready():
	background_tiles =get_parent().get_node("TileMap")
	

func set_cell(tilemap, x, y, id):
	tilemap.set_cell(x, y, id, false, false, false,get_subtile_with_priority(id,tilemap))


func get_subtile_with_priority(id, tilemap: TileMap):
	var tiles = tilemap.title_set
	var rect = tilemap.title_set.title_get_region(id)
	var size_x = rect.size.x /tiles.autotile_get_size(id).x
	var size_y = rect.size.y / tiles.autotile_get_size(id).y
	var tile_array = []
	for x in range(size_x):
		for y in range(size_y):
			var priority = tiles.autotile_get_subtile_priority(id, Vector2(x, y))
			for p in priority:
				tile_array.append(Vector2(x,y))


func generate_tiles_boundary(pos):
	var boundaries = [pos]
	
	for x in 13:
		for y in 8:
			boundaries.append({
				"x": pos.x + x,
				"y": pos.y + y
			})
			boundaries.append({
				"x": pos.x - x,
				"y": pos.y - y
			})
			boundaries.append({
				"x": pos.x + x,
				"y": pos.y - y
			})
			boundaries.append({
				"x": pos.x - x,
				"y": pos.y + y
			})
	return boundaries


func draw_background_tiles():
	var player_position = background_tiles.local_to_map(self.position)
	var boundaries = generate_tiles_boundary(player_position)
	 
	for i in boundaries:
		var tile = background_tiles.get_cell_tile_data(i.x, i.y)
		var has_tile = tile > -1
		if (!has_tile): set_cell(background_tiles, i.x, i.y, 0)

func _input(event):
	velocitymap = Vector2()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		move_to_position(get_global_mouse_position())
	if Input.is_action_pressed("move_right"):
		velocitymap.x += 1
	if Input.is_action_pressed("move_left"):
		velocitymap.x -= 1
	if Input.is_action_pressed("move_up"):
		velocitymap.y -= 1
	if Input.is_action_pressed("move_down"):
		velocitymap.y += 1
		
		
func _physics_process(delta):
	count += 1
	move(delta)
	
	
	if (count % 15 == 0):
		draw_background_tiles()
	pass

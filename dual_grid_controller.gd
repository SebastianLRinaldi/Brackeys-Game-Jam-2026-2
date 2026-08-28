@tool
extends Node2D

@onready var world_layer: TileMapLayer = $WorldLayer
@onready var display_layer: TileMapLayer = $DisplayLayer

# Pre-defined atlas coordinates for each of the 16 corner configurations (Vector2i)
# Change these values to match your specific Tileset layout order
const TILE_MAP = {
	0: Vector2i(0, 0),   # Empty
	1: Vector2i(1, 0),   # Top-Left only
	2: Vector2i(2, 0),   # Top-Right only
	3: Vector2i(3, 0),   # Top-Left + Top-Right
	4: Vector2i(0, 1),   # Bottom-Left only
	5: Vector2i(1, 1),   # Top-Left + Bottom-Left
	6: Vector2i(2, 1),   # Top-Right + Bottom-Left
	7: Vector2i(3, 1),   # Top-Left + Top-Right + Bottom-Left
	8: Vector2i(0, 2),   # Bottom-Right only
	9: Vector2i(1, 2),   # Top-Left + Bottom-Right
	10: Vector2i(2, 2),  # Top-Right + Bottom-Right
	11: Vector2i(3, 2),  # Top-Left + Top-Right + Bottom-Right
	12: Vector2i(0, 3),  # Bottom-Left + Bottom-Right
	13: Vector2i(1, 3),  # Top-Left + Bottom-Left + Bottom-Right
	14: Vector2i(2, 3),  # Top-Right + Bottom-Left + Bottom-Right
	15: Vector2i(3, 3)   # Fully Filled
}

## Call this method whenever you paint or erase a tile in the world
func set_world_tile(coords: Vector2i, is_filled: bool) -> void:
	if is_filled:
		# Use source_id 0 and atlas coords (0,0) as a simple boolean "filled" flag
		world_layer.set_cell(coords, 0, Vector2i(0,0))
	else:
		world_layer.set_cell(coords, -1)
	
	# Any single world tile change affects 4 surrounding display tiles
	update_display_tile(coords)
	update_display_tile(coords + Vector2i(0, -1))
	update_display_tile(coords + Vector2i(-1, 0))
	update_display_tile(coords + Vector2i(-1, -1))

## Recalculates what visual tile belongs on a given Display coordinate
func update_display_tile(display_coords: Vector2i) -> void:
	# Check the 4 world tiles surrounding this display corner intersection
	var tl = 1 if is_world_tile_filled(display_coords + Vector2i(0, 0)) else 0
	var tr = 1 if is_world_tile_filled(display_coords + Vector2i(1, 0)) else 0
	var bl = 1 if is_world_tile_filled(display_coords + Vector2i(0, 1)) else 0
	var br = 1 if is_world_tile_filled(display_coords + Vector2i(1, 1)) else 0
	
	# Calculate a unique 4-bit index value from 0 to 15
	var tile_index = tl * 1 + tr * 2 + bl * 4 + br * 8
	
	# Render the calculated tile onto our offset layer
	var atlas_coords = TILE_MAP[tile_index]
	display_layer.set_cell(display_coords, 0, atlas_coords)

## Helper function to check if a world coordinate is active
func is_world_tile_filled(coords: Vector2i) -> bool:
	return world_layer.get_cell_source_id(coords) != -1

## Helper function to completely redraw the visible grid (Useful for level initialization)
func refresh_entire_grid() -> void:
	display_layer.clear()
	var used_cells = world_layer.get_used_cells()
	
	# Find bounds to evaluate the display layer comprehensively
	for cell in used_cells:
		update_display_tile(cell)
		update_display_tile(cell + Vector2i(0, -1))
		update_display_tile(cell + Vector2i(-1, 0))
		update_display_tile(cell + Vector2i(-1, -1))

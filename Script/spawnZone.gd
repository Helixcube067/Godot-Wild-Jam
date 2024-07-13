extends Node2D


var npc1_scene = preload("res://assets/animal_test.tscn") # on affecte dans cette variable le type de pnj 
var npc2_scene = preload("res://assets/animal_test_2.tscn")


func _ready():
# Spawns 5 NPCs of type 1 and defines the range for X and Y coordinates


	spawn_npcs(npc1_scene, 5, Vector2(100, 500), Vector2(100, 500))
	# Fait apparaître 10 PNJ de type 2
	spawn_npcs(npc2_scene, 10, Vector2(600, 1000), Vector2(600, 1000))

# Generic function to prepare and spawn NPCs
func spawn_npcs(npc_scene, number_of_individuals, x_range: Vector2, y_range: Vector2):
	for i in range(number_of_individuals):
		# Generates random X and Y coordinates within the specified ranges
		var position = Vector2(randf_range(x_range.x, x_range.y), randf_range(y_range.x, y_range.y))
		# Prepares and spawns the NPC at the generated position
		var npc_instance = npc_scene.instantiate() # Instantiates the NPC from the preloaded scene
		add_child(npc_instance) # Adds the NPC to the scene tree
		npc_instance.position = position # Sets the NPC's position

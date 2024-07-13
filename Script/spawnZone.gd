extends Node2D

# Chargez la scène du NPC
var npc1_scene = preload("res://assets/animal_test.tscn")
var npc2_scene = preload("res://assets/animal_test_2.tscn")
func _ready():
	for i in 5:

		var positionsXAnimal1 = randf_range(100, 500)
		var positionsYAnimal1 = randf_range(100, 500)
		var positionsXAnimal2 = randf_range(600, 900)
		var positionsYAnimal2 = randf_range(600, 900)
		spawn_npc1(Vector2(positionsXAnimal1, positionsYAnimal1))
		spawn_npc2(Vector2(positionsXAnimal2, positionsYAnimal2))
	# Faites apparaître trois NPCs à des positions différentes


# Fonction pour faire apparaître un NPC à une position donnée
func spawn_npc1(spawn_position: Vector2):
	var npc_instance = npc1_scene.instantiate()
	add_child(npc_instance)
	npc_instance.position = spawn_position

func spawn_npc2(spawn_position: Vector2):
	var npc_instance = npc2_scene.instantiate()
	add_child(npc_instance)
	npc_instance.position = spawn_position

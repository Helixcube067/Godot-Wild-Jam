extends animalBase
@onready var detectionRange : Area2D = %"Detection Range"
var actionQueue : Array
var surroundingsInRange : Array

func _ready():
	animalType = type.Predator
	
func _physics_process(delta):
	if(hungry):
		SeekFood(delta)
		var collision : bool = move_and_slide()
		if(collision):
			if(get_last_slide_collision().get_collider().animalType == type.Prey):
				get_last_slide_collision().get_collider().free()
				hungry = false
	else:
		MovementCheck(delta)
		move_and_slide()
	
func SeekFood(delta):
	surroundingsInRange = detectionRange.get_overlapping_bodies()
	for i in surroundingsInRange.size():
		if(surroundingsInRange[i].animalType == type.Prey):
			destination = surroundingsInRange[i].global_position
	global_position = global_position.move_toward(destination, delta * SPEED)

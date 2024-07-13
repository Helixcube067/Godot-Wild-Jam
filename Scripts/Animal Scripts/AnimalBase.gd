extends CharacterBody2D
class_name animalBase

enum type {Prey, Predator}
const SPEED = 100.0
var destination : Vector2
var rng = RandomNumberGenerator.new()
var randomX : int
var randomY : int
var isMoving : bool = false
var pauseTime : int
#if moving is true then it checks to see if you reached the destination and if so turns is moving to false
#if moving is true and its not at the destination it keeps moving
#if moving is switched back to false then we get a new destination
func _physics_process(delta):
	if(isMoving):
		if(global_position == destination):
			isMoving = false
		else:
			global_position = global_position.move_toward(destination, delta * SPEED)
	else:
		SetNewDestination(delta)
	move_and_slide()

#Gets the delta to multiply the speedby and turns isMoving to true
#gets a random X and Y value within the range and adds it to the value of the current positions x and y
#moves toward that position
func SetNewDestination(delta):
	isMoving = true
	randomX = rng.randi_range(-100,100)
	randomY = rng.randi_range(-100,100)
	#can do trimming here to make sure it doesnt go out of bounds
	destination.x = position.x + randomX
	destination.y = position.y + randomY
	printt("Current global: " + str(global_position))
	printt("Destination: " + str(destination))
	global_position = global_position.move_toward(destination, delta * SPEED)

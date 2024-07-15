extends Control

var minuteur_is_running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.temps = true # Start with the day
	start_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if minuteur_is_running and $minuteur.time_left == 0:
		_on_minuteur_timeout()

func start_timer():
	$minuteur.start(60) # Start timer with 60-second waiting time
	minuteur_is_running = true

func _on_minuteur_timeout():
	print("Minuteur terminé")
	Global.temps = not Global.temps # Alternate between day and night
	print(Global.temps)
	start_timer() # reboot 

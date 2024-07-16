extends Label


var ressources : String = "objet nécésaire"  
# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(Global.XP) + "xp"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(Global.XP)
	

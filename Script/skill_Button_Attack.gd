extends TextureButton
class_name SkillAttackNode

@onready var panel = $Panel
@onready var label = $MarginContainer/Label
@onready var line_2d = $Line2D

var level: int = 0 
var max_level: int = 2
var number_of_clicks = 0 # variable used to correct a bug
func _ready():
	if get_parent() is SkillNode:
		line_2d.add_point(get_parent().global_position + size/2)

func set_level(value):
	level = value
	label.text = str(level) + "/" + str(max_level)

func _process(delta):
	label.text = str(level) + "/" + str(max_level)

func _on_pressed():
	if can_upgrade() && Global.XP >= 2:
		level = min(level + 1, max_level)
		Global.level_of_animal = min(Global.level_of_animal + 1, max_level) 
		print(Global.level_of_animal)
		panel.show_behind_parent = true
		number_of_clicks +=1
		print(number_of_clicks)
		line_2d.default_color = Color(1, 1, 0.24705882370472)
		if number_of_clicks <=2 :
			Global.XP -=2
	else:
		print("The parent node must be updated first, or you won't have xp.")

func can_upgrade() -> bool:
	var parent = get_parent()
	if parent is SkillNode:
		return parent.level >= 1  # or whatever level you require the parent to be
	return true

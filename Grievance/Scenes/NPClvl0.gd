extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	level0clear()
	

func NPClvl0():
	pass

func level0clear():
	if Level0.clear_condition == true:
		self.queue_free()

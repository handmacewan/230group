extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func tomb():
	pass
	
func floweradd():
	if Level5.initialtalk == true:
		$Sprite2D2.visible = true
	if Level5.initialtalk == false:
		$Sprite2D2.visible = false

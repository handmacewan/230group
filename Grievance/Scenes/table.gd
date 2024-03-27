extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tableclear()
	
func table():
	pass
	
func tableclear():
	if Level0.clear2 == true:
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
	if Level0.clear2 == false:
		$Sprite2D.visible = true
		$Sprite2D2.visible = false
